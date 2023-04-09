#!/bin/bash

set -e

VERSION=1.0.0
TARGET_PATH="/"

# Define color variables
PURPLE='\033[0;35m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Function to display help message
display_help() {
    cat <<EOF
Usage: cmd-dfd [OPTION]... YOUR_COMMAND

Example: cmd-dfd sudo apt update

Displays the difference in disk space before and after running the provided command.

Options:
  -h --help     display this help and exit
  -V --version  output version information and exit
  -p --path     specify the path to monitor disk space changes

EOF
}

# Function to convert disk space to a human-readable format
convert_to_human() {
    local size_kb=$1
    local gb=$((size_kb / 1024 / 1024))
    local mb=$((size_kb % (1024 * 1024) / 1024))
    local kb=$((size_kb % 1024))
    printf "%s GB, %s MB, %s KB" "$gb" "$mb" "$kb"
}

# Function to display available disk space
display_available_space() {
    local available_kb=$1
    printf "[cmd-dfd] - available disk space at ${PURPLE}%s${NC} : " "$TARGET_PATH"
    convert_to_human "$available_kb"
    printf "\n"
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    -h|--help)
      display_help
      exit 0
      ;;
    -V|--version)
      echo "cmd-dfd version : $VERSION"
      exit 0
      ;;
    -p|--path)
      shift
      TARGET_PATH="$1"
      shift
      ;;
    *)
      break
      ;;
  esac
done

# Calculate disk free space before running the command
initial_space=$(df --output=avail --block-size=1K "$TARGET_PATH" | tail -1)

# Run the input command
"$@"

# Calculate disk free space after running the command
final_space=$(df --output=avail --block-size=1K "$TARGET_PATH" | tail -1)

# Calculate the difference in disk space
space_diff=$((final_space - initial_space))

# Print the difference in a human-readable format
if [ $space_diff -gt 0 ]; then
    printf "[cmd-dfd] - disk free space at ${PURPLE}%s${NC} ${GREEN}INCREASE +${NC} " "$TARGET_PATH"
    convert_to_human $space_diff
    printf "\n"
elif [ $space_diff -lt 0 ]; then
    space_diff=$((space_diff * -1))
    printf "[cmd-dfd] - disk free space at ${PURPLE}%s${NC} ${RED}DECREASE -${NC} " "$TARGET_PATH"
    convert_to_human $space_diff
    printf "\n"
else
    printf "[cmd-dfd] - no change in disk space at ${PURPLE}%s${NC} \n" "$TARGET_PATH"
fi

# Print available free disk space
display_available_space "$final_space"
