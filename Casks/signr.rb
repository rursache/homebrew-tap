cask "signr" do
  version "1.0.1"
  sha256 "389aef1a86cc4f151ef9b474efc15884c3be113fbaf4b32ddc3ad50f8733528e"

  url "https://github.com/rursache/Signr/releases/download/v#{version}/Signr-#{version}.zip"
  name "Signr"
  desc "Sign and sideload iOS apps with your Apple ID"
  homepage "https://github.com/rursache/Signr"

  depends_on macos: :tahoe

  app "Signr.app"

  zap trash: [
    "~/Library/Application Support/Signr",
    "~/Library/Preferences/ro.randusoft.signr.plist",
    "~/Library/Saved Application State/ro.randusoft.signr.savedState",
  ]
end
