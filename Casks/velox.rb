cask "velox" do
  version "1.0.3"
  sha256 "159dae3988bd1b71047b2c497b15271c86b9911f1b4f8985a16c17c8d4bf1ae2"

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
