#!/usr/bin/env bash

if [[ "$#" -eq "5" ]]
then
  timeOutDark="$1"
  timeOutLock="$2"
  lightsOn="$3"
  lightsOff="$4"
  lock="$5"
  swayidle -w \
    timeout "$timeOutDark" "$lightsOff" resume "$lightsOn" \
    timeout "$timeOutLock" "$lock" resume "$lightsOn" \
    before-sleep "$lock"
    after-sleep "$lightsOn"
    lock "$lock"
else
  echo "5 arguments expected."
  exit 1
fi
