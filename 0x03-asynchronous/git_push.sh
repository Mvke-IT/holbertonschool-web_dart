#!/bin/bash

# Ask for a commit message
echo "Enter commit message: "
read commit_message

# Add all changes
git add .

# Commit with the message provided by the user
git commit -m "$commit_message"


# Push
git push 

echo "✅ Changes pushed successfully!"
