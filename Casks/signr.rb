cask "signr" do
  version "1.0.5"
  sha256 "3c657b610113bbdc9de068f7f30697903718a588ae8942fd55213071d57dd43b"

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
