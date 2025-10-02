#!/bin/bash
set -euo pipefail

# Extended Folder Bot
# Creates a folder, moves into it, creates files, and lists contents

read -p "📂 Enter folder name: " FOLDER_NAME

if [ -z "$FOLDER_NAME" ]; then
  echo "❌ Folder name cannot be empty!"
  exit 1
fi

# Create and move into folder
mkdir -p "$FOLDER_NAME"
cd "$FOLDER_NAME"
echo "✅ Folder '$FOLDER_NAME' created and opened."
echo "📂 Current location: $(pwd)"

# Ask for filenames
read -p "📜 Enter file names (separated by spaces): " FILE_NAMES

if [ -n "$FILE_NAMES" ]; then
  touch $FILE_NAMES
  echo "✅ Created file(s): $FILE_NAMES"
else
  echo "⚠️ No files entered, skipping file creation."
fi

# Show final contents
echo "📜 Contents of '$FOLDER_NAME':"
ls -la
