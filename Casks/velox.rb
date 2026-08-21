cask "velox" do
  version "1.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/rursache/Velox/releases/download/v#{version}/Velox-#{version}.zip"
  name "Velox"
  desc "Tiny native Spotlight replacement for macOS"
  homepage "https://github.com/rursache/Velox"

  depends_on macos: :sequoia

  app "Velox.app"

  zap trash: [
    "~/Library/Preferences/ro.randusoft.velox.plist",
    "~/Library/Application Support/Velox",
    "~/Library/Saved Application State/ro.randusoft.velox.savedState",
  ]
end
