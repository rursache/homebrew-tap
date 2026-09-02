cask "velox" do
  version "1.0.5"
  sha256 "fcb0950ed8c223677bc27f749c6efadbd949a26be83f04111d2209b987ab7818"

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
