#!/bin/bash
# Hyprshot + Rofi Interactive Screenshot Script
# this testing script
# --- Configuration ---
# Directory where screenshots will be saved
SHOTS_DIR="$HOME/Pictures/Screenshots"

# Get the current timestamp for the filename
TIMESTAMP=$(date +'%Y-%m-%d_%H-%M-%S')
FILENAME="Screenshot_$TIMESTAMP.png"
FILE_PATH="$SHOTS_DIR/$FILENAME"

# --- Rofi Menu ---
# Define the options presented to the user
OPTIONS="Area (Save)\nArea (Copy)\nWindow (Save)\nWindow (Copy)\nScreen (Save)\nScreen (Copy)"

# Use rofi in dmenu mode to get the user's choice
CHOICE=$(echo -e "$OPTIONS" | rofi \
    -dmenu \
    -i \
    -p "Hyprshot Action:" \
    -theme-str 'listview { lines: 6; }' \
    -theme-str 'window { width: 30%; }'
)

# Check if the user made a selection (not cancelled)
if [[ -z "$CHOICE" ]]; then
    exit 0
fi

# --- Action Handler ---

case "$CHOICE" in
    "Area (Save)")
        # 1. Ensure the directory exists
        mkdir -p "$SHOTS_DIR"
        # 2. Capture a region and save the output to the file path
        if hyprshot -m region -s "$FILE_PATH"; then
            notify-send "📸 Screenshot Saved" "Captured region saved as <b>$FILENAME</b>"
        fi
        ;;

    "Area (Copy)")
        # Capture a region and copy the output to the clipboard
        if hyprshot -m region -c; then
            notify-send "📋 Screenshot Copied" "Captured region copied to clipboard."
        fi
        ;;

    "Window (Save)")
        # 1. Ensure the directory exists
        mkdir -p "$SHOTS_DIR"
        # 2. Capture a specific window and save the output to the file path
        if hyprshot -m window -s "$FILE_PATH"; then
            notify-send "📸 Screenshot Saved" "Captured window saved as <b>$FILENAME</b>"
        fi
        ;;

    "Window (Copy)")
        # Capture a specific window and copy the output to the clipboard
        if hyprshot -m window -c; then
            notify-send "📋 Screenshot Copied" "Captured window copied to clipboard."
        fi
        ;;

    "Screen (Save)")
        # 1. Ensure the directory exists
        mkdir -p "$SHOTS_DIR"
        # 2. Capture the current output/monitor and save the output to the file path
        if hyprshot -m output -s "$FILE_PATH"; then
            notify-send "📸 Screenshot Saved" "Captured screen saved as <b>$FILENAME</b>"
        fi
        ;;

    "Screen (Copy)")
        # Capture the current output/monitor and copy the output to the clipboard
        if hyprshot -m output -c; then
            notify-send "📋 Screenshot Copied" "Captured screen copied to clipboard."
        fi
        ;;

    *)
        # Default case for unexpected input or cancellation (already handled above, but good practice)
        exit 0
        ;;
esac

exit 0
