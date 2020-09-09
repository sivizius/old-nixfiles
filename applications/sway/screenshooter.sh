#!/usr/bin/env bash

mkdir -p "$HOME/.screenshots"
OUTPUT="$HOME/.screenshots/$(date -Iseconds).png"
grim -g "$(slurp -d)" "$OUTPUT"
notify-send -t 10000 "Screenshot saved to" "$OUTPUT"
