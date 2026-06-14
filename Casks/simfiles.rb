cask "simfiles" do
  version "1.2.1"
  sha256 "d581be169ef135b9c96b88d1a55b07a927c4562353d44804cc6f0117d52afe29"

  url "https://github.com/rursache/SimFiles/releases/download/v#{version}/SimFiles-#{version}.zip"
  name "SimFiles"
  desc "Manage files in the iOS Simulator's Files app storage"
  homepage "https://github.com/rursache/SimFiles"

  depends_on macos: :tahoe

  app "SimFiles.app"

  zap trash: [
    "~/Library/Preferences/ro.randusoft.SimFiles.plist",
    "~/Library/Application Scripts/ro.randusoft.SimFiles",
    "~/Library/Containers/ro.randusoft.SimFiles",
    "~/Library/Saved Application State/ro.randusoft.SimFiles.savedState",
  ]
end
