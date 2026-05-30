cask "calendarplusplus" do
  version "1.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/rursache/CalendarPlusPlus/releases/download/v#{version}/CalendarPlusPlus-#{version}.zip"
  name "Calendar++"
  desc "Menu bar app to enhance the macOS Calendar experience"
  homepage "https://github.com/rursache/CalendarPlusPlus"

  depends_on macos: ">= :tahoe"

  app "CalendarPlusPlus.app"

  zap trash: [
    "~/Library/Preferences/ro.randusoft.CalendarPlusPlus.plist",
    "~/Library/Application Scripts/ro.randusoft.CalendarPlusPlus",
    "~/Library/Containers/ro.randusoft.CalendarPlusPlus",
    "~/Library/Saved Application State/ro.randusoft.CalendarPlusPlus.savedState",
  ]
end