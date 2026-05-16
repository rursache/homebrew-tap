cask "simfiles" do
  version "1.2.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/rursache/SimFiles/releases/download/v#{version}/SimFiles-#{version}.zip"
  name "SimFiles"
  desc "Manage files in the iOS Simulator's Files app storage"
  homepage "https://github.com/rursache/SimFiles"

  depends_on macos: ">= :tahoe"

  app "SimFiles.app"

  zap trash: [
    "~/Library/Preferences/ro.randusoft.SimFiles.plist",
    "~/Library/Application Scripts/ro.randusoft.SimFiles",
    "~/Library/Containers/ro.randusoft.SimFiles",
    "~/Library/Saved Application State/ro.randusoft.SimFiles.savedState",
  ]
end
