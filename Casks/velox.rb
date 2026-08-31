cask "velox" do
  version "1.0.4"
  sha256 "c43a8f4f6a034a1894ee286ca0ebc20cb1a3531587147116e1a8ef6b2cb9be75"

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
