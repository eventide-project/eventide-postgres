#!/usr/bin/env bash

set -e

if [ -z ${GEM_AUTHORITY_PATH+x} ]; then
  echo "GEM_AUTHORITY_PATH is not set"
  exit
fi

echo
echo 'Installing local gems'
echo '= = ='

source ./set-local-gem-path.sh

echo
echo 'Removing gem files'
echo '- - -'
if test -n "$(find . -maxdepth 1 -name '*.gem' -print -quit)"; then
  for gem in *.gem; do
    echo "- $gem"
    rm $gem
  done
else
  echo "(No gem files found)"
fi

echo
echo 'Building gems'
echo '- - -'
for gemspec in *.gemspec; do
  echo "- $gemspec"
  gem build $gemspec
done

if [ -z ${POSTURE+x} ]; then
  echo "(POSTURE is not set. Using \"operational\" by default.)"
  posture="operational"
else
  posture=$POSTURE
fi

scheme="https:"
gem_repo_authority_path=$GEM_AUTHORITY_PATH
public_gem_repo_uri="$scheme//$gem_repo_authority_path"

gemfury_token=""
if [ ! -z ${GEMFURY_TOKEN+x} ]; then
  gemfury_token=$GEMFURY_TOKEN
fi

private_source=""
if [ ! $gemfury_token = "" ]; then
  private_gem_repo_uri="$scheme//$gemfury_token@$gem_repo_authority_path"
  private_source="--source $private_gem_repo_uri"
fi

public_source="--source $public_gem_repo_uri"

ruby_gems_source="--source https://rubygems.org"

echo
echo "Installing gems locally (posture: $posture)"
echo '- - -'
for gem in *.gem; do
  echo "($gem)"
  cmd="gem install $gem --clear-sources $private_source $public_source $ruby_gems_source --install-dir ./gems"

  if [ operational != "$posture" ]; then
    cmd="$cmd --development"
  fi

  echo $cmd
  ($cmd) || exit 1
done

echo '= = ='
echo '(done)'
echo
