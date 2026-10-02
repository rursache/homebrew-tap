cask "signr" do
  version "1.1.3"
  sha256 "9bbe4b5d6193a15d12e6440859127f42c3662015230677ac656de557c929ea7a"

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
