#!/bin/bash
# check if shell if bash or zsh and set profile accordingly
if [ -n "$ZSH_VERSION" ]; then
  SHELLRC=~/.zshrc
elif [ -n "$BASH_VERSION" ]; then
  SHELLRC=~/.bashrc
fi

# check if UV is installed already, if not install, else continue
if ! command -v uv 2>&1 >/dev/null; 
then
    echo "installing UV"
    curl -LsSf https://astral.sh/uv/install.sh | sh
    echo "reloading your shell, re-run this afterwards"
    source $SHELLRC
fi

# install python with uv
uv python install

uv sync

uv tool install pre-commit

pre-commit install


