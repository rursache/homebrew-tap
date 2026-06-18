cask "signr" do
  version "1.0.6"
  sha256 "d19abd877f068c29f4807d090326b259008b10b5bef86879c81978e0c2dac262"

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
