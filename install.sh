#!/bin/bash

set -e

REPO_DIR="$HOME/my-ai-toolkit"
SKILLS_DIR="$HOME/.config/opencode/skills"

echo "🚀 Installing My AI Toolkit..."

# Clone or update repository
if [ -d "$REPO_DIR/.git" ]; then
    echo "📥 Updating existing repository..."
    git -C "$REPO_DIR" pull
else
    echo "📥 Cloning repository..."
    git clone https://github.com/manikantamedindi/my-ai-toolkit.git "$REPO_DIR"
fi

# Create OpenCode skills directory
mkdir -p "$SKILLS_DIR"

echo "🔗 Linking skills..."

for dir in "$REPO_DIR"/skills/*; do
    name=$(basename "$dir")

    rm -rf "$SKILLS_DIR/$name"

    ln -s "$dir" "$SKILLS_DIR/$name"

    echo "   ✓ $name"
done

echo ""
echo "✅ Installation completed."
echo ""
echo "Restart OpenCode."