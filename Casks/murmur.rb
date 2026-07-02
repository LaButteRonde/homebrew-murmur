cask "murmur" do
  version "0.1.5"
  sha256 "81d199aa95b11b31479fabb0ff60b88e4d856a8acba287bd4a1a181fe3bd5214"

  url "https://github.com/LaButteRonde/homebrew-murmur/releases/download/v#{version}/Murmur-darwin-arm64-#{version}.zip"
  name "Murmur"
  desc "Dictée vocale 100 % locale pour macOS — Whisper + correction LLM, sans cloud"
  homepage "https://github.com/LaButteRonde/homebrew-murmur"

  depends_on arch: :arm64

  app "Murmur.app"

  # Mise à jour sans friction : l'instance en cours est quittée proprement
  # avant le remplacement (TERM en filet), puis relancée par le postflight.
  uninstall quit:   "com.murmur.app",
            signal: ["TERM", "com.murmur.app"]

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "#{appdir}/Murmur.app"],
      sudo: false
    system_command "/usr/bin/open",
      args: ["-a", "#{appdir}/Murmur.app"],
      sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.murmur.app",
    "~/Library/Preferences/com.murmur.app.plist",
  ]
end
