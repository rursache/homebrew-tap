cask "velox" do
  version "1.0.7"
  sha256 "7d33f9b96caeade49f464ea7de0eae5372d428c92090256a5da58fdd1065c710"

  url "https://github.com/rursache/Velox/releases/download/v#{version}/Velox-#{version}.zip"
  name "Velox"
  desc "Ultra-fast native macOS Spotlight-style launcher"
  homepage "https://github.com/rursache/Velox"

  depends_on macos: :sequoia

  app "Velox.app"

  zap trash: [
    "~/Library/Preferences/ro.randusoft.velox.plist",
    "~/Library/Application Support/Velox",
    "~/Library/Saved Application State/ro.randusoft.velox.savedState",
  ]
end
