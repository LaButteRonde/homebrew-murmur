cask "murmur" do
  version "0.1.0"
  # TODO: remplacer par le sha256 du zip à la première release :
  #   shasum -a 256 Murmur-darwin-arm64-0.1.0.zip
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/LaButteRonde/homebrew-murmur/releases/download/v#{version}/Murmur-darwin-arm64-#{version}.zip"
  name "Murmur"
  desc "Dictée vocale 100 % locale pour macOS — Whisper + correction LLM, sans cloud"
  homepage "https://github.com/LaButteRonde/homebrew-murmur"

  depends_on arch: :arm64

  app "Murmur.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "#{appdir}/Murmur.app"],
      sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.murmur.app",
    "~/Library/Preferences/com.murmur.app.plist",
  ]
end
