# Windows
# if [ -e %APPDATA%\Code\User ]; then
#     cd %APPDATA%\Code\User

# Mac
# if [ -e $HOME/Library/Application Support/Code/User ]; then
#     cd $HOME/Library/Application Support/Code/User

# Linux
if [ -e $HOME/.config/Code/User ]; then
    cd $HOME/.config/Code/User

    mv settings.json settings.json.bak
    mv keybindings.json keybindings.json.bak
    mv snippets snippets.bak

    ln -is ~/myvscode/settings.json
    ln -is ~/myvscode/keybindings.json
    ln -is ~/myvscode/snippets

    for extension in `cat ~/myvscode/extensions.txt`; do
        code --install-extension $extension
    done
fi