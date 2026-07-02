cask "murmur" do
  version "0.1.3"
  sha256 "9082ec2299b61fc4292f2f5f010ae43775aef0d0073558993d34f9715a0d1dde"

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
