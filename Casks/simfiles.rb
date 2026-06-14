cask "simfiles" do
  version "1.2.1"
  sha256 "dad61fc6d4c31a58e93cb8503f2dadf4be43a5177cdceb4066ac37aa6c2e978f"

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
