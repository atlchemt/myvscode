#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# Windows
if [ -e %APPDATA%\Code\User ]; then
    STR=%APPDATA%\Code\User
    cd %APPDATA%\Code\User
fi

# Mac
if [ -e $HOME/Library/Application\ Support/Code/User ]; then
    STR=$HOME/Library/Application\ Support/Code/User
    cd $HOME/Library/Application\ Support/Code/User
fi
# Linux
if [ -e $HOME/.config/Code/User ]; then
    STR=$HOME/.config/Code/User
    cd $HOME/.config/Code/User
fi


if [ -e "$STR" ]; then
    if [ -e "$STR"/settings.json ]; then
    mv -f settings.json settings.json.bak
    fi
    if [ -e "$STR"/keybindings.json ]; then
    mv -f keybindings.json keybindings.json.bak
    fi
    if [ -e "$STR"/snippets ]; then
    mv -f snippets snippets.bak
    fi

    cp $SCRIPT_DIR/settings.json "$STR"/
    cp $SCRIPT_DIR/keybindings.json "$STR"/
    cp -r $SCRIPT_DIR/snippets "$STR"/

    for extension in `cat $SCRIPT_DIR/extensions.txt`; do
        code --install-extension $extension
    done
fi