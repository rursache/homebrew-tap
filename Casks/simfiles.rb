cask "simfiles" do
  version "1.2.0"
  sha256 "ed84c5c84b4a2f17469807eca5dcc9f10ecfd84c7fe22a73d75e40f7bf825423"

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
