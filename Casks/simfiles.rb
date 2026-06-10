cask "simfiles" do
  version "1.2.1"
  sha256 "e81c9ba87fcf48b86fe7817a247012e1702e76089806179fd508363e87a7700e"

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
