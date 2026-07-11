cask "murmur" do
  version "0.2.2"
  sha256 "1c7d60771aa354924008fb47a6dcb86c64efcc34de1897a02bf4208933f0bf6e"

  url "https://github.com/LaButteRonde/homebrew-murmur/releases/download/v#{version}/Murmure-darwin-arm64-#{version}.zip"
  name "Murmure"
  desc "Dictée vocale 100 % locale pour macOS — Whisper + correction LLM, sans cloud"
  homepage "https://github.com/LaButteRonde/homebrew-murmur"

  depends_on arch: :arm64

  app "Murmure.app"

  # Mise à jour sans friction : l'instance en cours est quittée proprement
  # avant le remplacement (TERM en filet), puis relancée par le postflight.
  uninstall quit:   "com.murmur.app",
            signal: ["TERM", "com.murmur.app"]

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "#{appdir}/Murmure.app"],
      sudo: false
    system_command "/usr/bin/open",
      args: ["-a", "#{appdir}/Murmure.app"],
      sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.murmur.app",
    "~/Library/Preferences/com.murmur.app.plist",
  ]
end
