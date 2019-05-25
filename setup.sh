#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# Windows (cgwin)
if [ -e "$HOME/AppData/Roaming/Code/User" ]; then
    STR=$HOME/AppData/Roaming/Code/User
    cd "$HOME"/AppData/Roaming/Code/User
fi

# Mac
if [ -e "$HOME/Library/Application\ Support/Code/User" ]; then
    STR=$HOME/Library/Application\ Support/Code/User
    cd $HOME/Library/Application\ Support/Code/User
fi
# Linux
if [ -e "$HOME/.config/Code/User" ]; then
    STR=$HOME/.config/Code/User
    cd $HOME/.config/Code/User
fi


if [ -e "$STR" ]; then
    if [ -e "$STR"/settings.json ]; then
    mv -n "$STR"/settings.json "$STR"/settings.json.bak
    fi
    if [ -e "$STR"/keybindings.json ]; then
    mv -n "$STR"/keybindings.json "$STR"/keybindings.json.bak
    fi
    if [ -e "$STR"/snippets ]; then
    mv -n "$STR"/snippets "$STR"/snippets.bak
    fi

    cp "$SCRIPT_DIR"/settings.json "$STR"/
    cp "$SCRIPT_DIR"/keybindings.json "$STR"/
    cp -r "$SCRIPT_DIR"/snippets "$STR"/

    for extension in `cat "$SCRIPT_DIR"/extensions.txt`; do
        code --install-extension $extension
    done
fi