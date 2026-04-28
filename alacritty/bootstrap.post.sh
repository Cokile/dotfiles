#!/usr/bin/env bash

set -e

if [[ "$OSTYPE" != darwin* ]]; then
    echo "Skipping Alacritty icon replacement (macOS only)."
    exit 0
fi

# skip if Alacritty isn't installed
if [[ ! -d "/Applications/Alacritty.app" ]]; then
    echo "Skipping Alacritty icon replacement (/Applications/Alacritty.app not found)."
    exit 0
fi

# replace icon
echo "Replacing Alacritty's icon..."
if osascript <<'END'
use framework "AppKit"
use scripting additions
set icon to "https://media.macosicons.com/parse/files/macOSicons/dad09a2b1be53dac2342a3e9daca2b4a_Alacritty.icns"
set iconURL to current application's NSURL's URLWithString:icon
set iconImage to (current application's NSImage's alloc)'s initWithContentsOfURL:iconURL
set workspace to current application's NSWorkspace's sharedWorkspace()
workspace's setIcon:iconImage forFile:"/Applications/Alacritty.app" options:0
END
then
    echo "Replaced Alacritty's icon."
else
    echo "WARN: failed to replace Alacritty's icon." >&2
fi

