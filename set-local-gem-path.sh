#!/usr/bin/env bash

unchanged_gem_path=$GEM_PATH

if [[ ! $GEM_PATH == *"./gems"* ]]; then
  export GEM_PATH=./gems:$GEM_PATH

  echo "Gem path was changed"
  echo " from: $unchanged_gem_path"
  echo "   to: $GEM_PATH"
else
  echo "Gem path was unchanged"
  echo " from: $unchanged_gem_path"
fi

echo
