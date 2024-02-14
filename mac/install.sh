#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <profile_name>"
  echo "   ex: $0 adam"
  exit 1
fi

PROFILE_PATH="profiles/$1"

if [ ! -d "$PROFILE_PATH" ]; then
  echo "Profile: "$1" not found!"
  exit 1
fi

./install_tools.sh
./install_profile.sh $1

