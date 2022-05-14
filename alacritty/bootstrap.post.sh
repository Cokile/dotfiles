#!/usr/bin/env bash

set -e

# replace icon
echo "Replacing Alacritty's icon..."
osascript <<END
use framework "AppKit"
use scripting additions
set icon to "https://media.macosicons.com/parse/files/macOSicons/dad09a2b1be53dac2342a3e9daca2b4a_Alacritty.icns"
set iconURL to current application's NSURL's URLWithString:icon
set iconImage to (current application's NSImage's alloc)'s initWithContentsOfURL:iconURL
set workspace to current application's NSWorkspace's sharedWorkspace()
workspace's setIcon:iconImage forFile:"/Applications/Alacritty.app" options:0
END
echo "Replaced Alacritty's icon."

