#!/bin/bash

# Log levels and their respective descriptions for some variety!
declare -A LOG_LEVELS=(
    #["user.info"]="📰 Info"
    ["user.warning"]="Warning"
    #["user.error"]="🚨 Error"
    #["user.crit"]="🔥 Critical"
)

# Array of funny log messages
MESSAGES=(
    "Did you know? The first computer 'bug' was a real bug. 🐛"
    "The WiFi password is 'tryagain123' 🤫"
    "Error 404: Coffee not found ☕️"
    "You don't need to be a rocket scientist to understand this...but it helps 🚀"
    "Why did the programmer quit? Because he didn't get arrays 🙃"
    "WARNING: Keyboard not found. Press F1 to continue... 🔄"
    "SysAdmin’s rule: If it works, don’t touch it! 🤐"
    "Failed to connect brain: Out of memory 🧠💥"
    "Someone sent a fax: what's next, smoke signals? 🥲"
)

# Randomly log messages at random intervals
for i in {1..10000}; do
    # Pick a random log level and message
    LEVEL=${!LOG_LEVELS[@]}
    RANDOM_LEVEL=${LEVEL[$RANDOM % ${#LEVEL[@]}]}
    RANDOM_MESSAGE=${MESSAGES[$RANDOM % ${#MESSAGES[@]}]}

    # Log the message with the chosen log level
    logger -n 127.0.0.1 -P 514 -p $RANDOM_LEVEL -t testlogger "${LOG_LEVELS[$RANDOM_LEVEL]}: $RANDOM_MESSAGE"

    # Pause between 1 and 3 seconds
    sleep $(echo "scale=2; 0.0$((RANDOM % 5 + 5))" | bc)
done

echo "✨ Done logging! Check your syslog output to view the messages."
