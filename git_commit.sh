#!/bin/bash

# Load environment variables from .env
export $(grep -v '^#' .env | xargs)

# Navigate to your project folder
cd /home/johan/mypaperhive.com || exit

# Initialize git only if .git folder doesn't exist
if [ ! -d ".git" ]; then
  git init
fi

# Add all files
git add .

# Prompt for commit message
read -p "Enter commit message: " commit_msg

# Commit changes (allow empty commit if nothing changed)
git commit -m "$commit_msg" || echo "No changes to commit."

# Add remote only if it doesn't exist
if ! git remote | grep -q origin; then
  git remote add origin https://$GITHUB_TOKEN@github.com/Johan1974/mypaperhive.git
fi

# Check if main branch exists locally
if git show-ref --verify --quiet refs/heads/main; then
  # Switch to main branch
  git checkout main
else
  # Create and switch to main branch
  git checkout -b main
fi

# Pull remote changes and merge to avoid push conflicts
git pull --rebase origin main

# Push to remote main branch
git push -u origin main
