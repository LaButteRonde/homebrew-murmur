cask "murmur" do
  version "0.1.0"
  sha256 "9fe91337c50afea1258f5a7f23ea4c489cf0e8133b8a6a09d04676746c62e348"

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
