#!/bin/bash

# Get current username
CURRENT_USER=$(whoami)
echo "🎉 Hey $CURRENT_USER! Welcome to ezatm setup - where we make your terminal life easier than finding a cat video on the internet! 🐱"
echo "-------------------------------------------"

# Get the absolute path of the script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Make ezatm.sh executable
chmod +x "$SCRIPT_DIR/ezatm.sh" 2>/dev/null || {
    echo "Error: ezatm.sh not found or permission denied"
    exit 1
}

# Detect shell type and add alias
SHELL_RC=""

# First try to detect the user's login shell
USER_SHELL=$(basename "$SHELL")

# Then check current shell or user's default shell
if [ "$USER_SHELL" = "zsh" ] || [ -n "$ZSH_VERSION" ]; then
    SHELL_RC="$HOME/.zshrc"
    echo "Detected Zsh shell"
elif [ "$USER_SHELL" = "bash" ] || [ -n "$BASH_VERSION" ]; then
    SHELL_RC="$HOME/.bashrc"
    echo "Detected Bash shell"
else
    echo "Unsupported shell. Please manually add the alias to your shell configuration file."
    exit 1
fi

# Check if alias already exists
if ! grep -v '^#' "$SHELL_RC" | grep -q "alias ez=\"\$HOME/ezatm/ezatm.sh\""; then
    echo "# For ezatm tool" >> "$SHELL_RC"
    echo "alias ez=\"\$HOME/ezatm/ezatm.sh\"" >> "$SHELL_RC"
    echo "🎯 Boom! The 'ez' alias has found its new home in $SHELL_RC"
else
    echo "👀 Looks like 'ez' is already living happily in $SHELL_RC"
fi

echo "
🎊 Woohoo! Setup is complete as smooth as butter! 🧈
🚀 Time to power up your terminal experience!

Please choose how you'd like to proceed:
"

select choice in "🔄 Restart terminal (Fresh start)" "⚡️ Quick reload (Source $SHELL_RC)"; do
    case $choice in
        "🔄 Restart terminal (Fresh start)")
            echo "🚪 Closing current terminal and opening a new one..."
            osascript -e 'tell application "Terminal" to do script ""' && exit
            break
            ;;
        "⚡️ Quick reload (Source $SHELL_RC)")
            echo "⚡️ Reloading your shell configuration..."
            if [ "$USER_SHELL" = "zsh" ]; then
                echo "Detected Zsh shell, executing reload with zsh..."
                echo "🎉 All done! You can now use the 'ez' command!"
                exec zsh -l
            else
                source "$SHELL_RC"
                echo "🎉 All done! You can now use the 'ez' command!"
            fi
            break
            ;;
        *) 
            echo "🤔 Please choose 1 or 2"
            ;;
    esac
done 