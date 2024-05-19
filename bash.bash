#!/bin/bash

# Define base URLs for different actions
declare -A actions
actions["main"]="https://www.main-url.com"
actions["test"]="https://www.test-url.com"
actions["author"]="https://www.author-url.com"

# Get action and custom string from command-line arguments
action=$1
customString=$2

# Check if the action is valid
if [[ ${actions[$action]+_} ]]; then
    url="${actions[$action]}"
    # If a custom string is provided, append it to the URL
    if [ -n "$customString" ]; then
        url="$url/$customString"
    fi
    # Open the URL in the default web browser
    xdg-open "$url" || open "$url" || echo "Unable to open URL: $url"
    echo "Opened $url"
else
    echo "Invalid action. Please use 'main', 'test', or 'author'."
fi
