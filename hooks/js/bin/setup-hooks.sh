#!/bin/bash

IN_CI=$(printenv | sed 's;=.*;;' | grep -E "(CI|JENKINS)")

if [ ! $IN_CI ]; then
  SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
  REPO_ROOT="$SCRIPT_DIR/.."

  if [ ! -d "$REPO_ROOT/.git/hooks.bak" ]; then
    mv "$REPO_ROOT/.git/hooks" "$REPO_ROOT/.git/hooks.bak"
    ln -s "$REPO_ROOT/.githooks/" "$REPO_ROOT/.git/hooks"
  fi
fi
