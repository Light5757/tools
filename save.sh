#!/bin/bash
# save.sh - commit all changes; push only when --push is given
# USAGE:
#   ./save.sh "message"          -> commit only
#   ./save.sh "message" --push   -> commit and push

if [ -z "$1" ]; then
    echo "Usage: ./save.sh \"message\" [--push]"
    exit 1
fi
MESSAGE="$1"

git add -A || { echo "Failed to stage changes."; exit 1; }

if git diff --cached --quiet; then
    echo "Nothing new to commit."
    exit 0
fi

git commit -m "$MESSAGE" || { echo "Commit failed. See the error above."; exit 1; }
echo "Committed: $MESSAGE"

if [ "$2" = "--push" ]; then
    git push || { echo "Push failed. Check your connection and try again."; exit 1; }
    echo "Pushed to origin/$(git rev-parse --abbrev-ref HEAD)."
else
    echo "Not pushed. Add --push after testing, or run git push."
fi
