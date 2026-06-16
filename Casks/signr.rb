cask "signr" do
  version "1.0.4"
  sha256 "e8c61ef2869b4675babb08c7c069e1d387e72cba839d46391ccf92f69478fbeb"

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
