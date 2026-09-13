cask "velox" do
  version "1.0.6"
  sha256 "7ffbaa32830bd1bc264cffc04584c34eb844ae6b3d417fc8df3a25cc96e81664"

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
