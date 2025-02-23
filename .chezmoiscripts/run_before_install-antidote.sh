#! /bin/bash

antidote_dir="${ZDOTDIR:-~}/.antidote"
if [ ! -d "$antidote_dir" ]; then
  git clone --depth=1 https://github.com/mattmc3/antidote.git "$antidote_dir"
fi
