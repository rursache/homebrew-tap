cask "calendarplusplus" do
  version "1.0.0"
  sha256 "9bed782b24e2df30d1293ccf3ea677feed41b8999e032d1ff141115ced0217f8"

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