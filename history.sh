#!/bin/bash

# ============================================================
# FILE:    history.sh
# PURPOSE: Show history of all saves to GitHub
#
# HOW TO USE:
#   ./history.sh          (shows simple list)
#   ./history.sh full     (shows detailed list)
#   ./history.sh find     (search for keyword)
#
# EXAMPLES:
#   ./history.sh
#   ./history.sh full
#   ./history.sh find Firebase
# ============================================================

# -------------------------------------------------------
# Check what type of history view was requested
# $1 = first parameter typed after ./history.sh
# -------------------------------------------------------

if [ -z "$1" ]; then
    # -------------------------------------------------------
    # No parameter = show simple one line view
    # Easiest to read at a glance
    # Like a quick summary list
    # -------------------------------------------------------
    echo ""
    echo "📋 SAVE HISTORY (newest first):"
    echo "================================"
    git log --oneline --decorate --color
    echo ""

elif [ "$1" = "full" ]; then
    # -------------------------------------------------------
    # "full" parameter = show detailed view with dates
    # Shows who saved, when, and what changed
    # Like a detailed security camera log
    # -------------------------------------------------------
    echo ""
    echo "📋 DETAILED SAVE HISTORY:"
    echo "========================="
    git log --stat --decorate --color
    echo ""

elif [ "$1" = "find" ]; then
    # -------------------------------------------------------
    # "find" parameter = search for keyword in messages
    # $2 = second parameter = the keyword to search for
    # Like searching email inbox for specific subject
    # -------------------------------------------------------
    if [ -z "$2" ]; then
        echo "❌ Please provide a search keyword!"
        echo "EXAMPLE: ./history.sh find Firebase"
        exit 1
    fi
    echo ""
    echo "🔍 Searching saves containing: $2"
    echo "==================================="
    git log --oneline --grep="$2" --color
    echo ""

else
    # -------------------------------------------------------
    # Unknown parameter = show help message
    # -------------------------------------------------------
    echo ""
    echo "❌ Unknown option: $1"
    echo ""
    echo "USAGE:"
    echo "  ./history.sh          Show simple history"
    echo "  ./history.sh full     Show detailed history"
    echo "  ./history.sh find X   Find saves containing X"
    echo ""
fi
