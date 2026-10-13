cask "balatro-mod-manager" do
  version "1.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/rursache/balatro-mod-manager/releases/download/v#{version}/Balatro-Mod-Manager-#{version}-macos-universal.zip"
  name "Balatro Mod Manager"
  desc "Find, install and manage mods for Balatro"
  homepage "https://github.com/rursache/balatro-mod-manager"

  depends_on :macos

  app "Balatro Mod Manager.app"

  zap trash: [
    "~/Library/Application Support/com.balatro-mod-manager.app",
    "~/Library/Caches/balatro-mod-manager",
    "~/Library/Caches/com.balatro-mod-manager.app",
    "~/Library/HTTPStorages/com.balatro-mod-manager.app",
    "~/Library/Logs/com.balatro-mod-manager.app",
    "~/Library/Preferences/com.balatro-mod-manager.app.plist",
    "~/Library/Saved Application State/com.balatro-mod-manager.app.savedState",
    "~/Library/WebKit/com.balatro-mod-manager.app",
  ]
end
