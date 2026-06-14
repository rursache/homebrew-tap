cask "calendarplusplus" do
  version "1.0.3"
  sha256 "01a683a35708a7a775bea561bef33d73b28ab14d058aead42f0fbc3c5220aac4"

  url "https://github.com/rursache/CalendarPlusPlus/releases/download/v#{version}/CalendarPlusPlus-#{version}.zip"
  name "Calendar++"
  desc "Menu bar app to enhance the macOS Calendar experience"
  homepage "https://github.com/rursache/CalendarPlusPlus"

  depends_on macos: :tahoe

  app "CalendarPlusPlus.app"

  zap trash: [
    "~/Library/Preferences/ro.randusoft.CalendarPlusPlus.plist",
    "~/Library/Application Scripts/ro.randusoft.CalendarPlusPlus",
    "~/Library/Containers/ro.randusoft.CalendarPlusPlus",
    "~/Library/Saved Application State/ro.randusoft.CalendarPlusPlus.savedState",
  ]
end