#!/bin/bash

CI_VARS=$(printenv | sed 's;=.*;;' | grep -E "(CI|JENKINS)")

if [[ "$CI_VARS" == "" ]]; then
  SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
  REPO_ROOT="$SCRIPT_DIR/.."

  # Create symlink if one doesn't already exist
  if [ ! -L "$REPO_ROOT/.git/hooks" ]; then
    echo;
    
    # Back up the current hooks folder just in case a User has something in
    # there they want to keep.
    if [ -d "$REPO_ROOT/.git/hooks" ]; then
      echo "[BACK-UP] 'hooks' folder to 'hooks.bak'"
      mv "$REPO_ROOT/.git/hooks" "$REPO_ROOT/.git/hooks.bak"
    fi

    # Create the symlink
    ln -s "$REPO_ROOT/.githooks/" "$REPO_ROOT/.git/hooks"
    echo "[CREATED] Sym-link for hooks"
  else
    echo;
    echo "[SKIP] Sym-link creation, hooks are already wired up"
  fi
else
  echo;
  echo "[DETECTED] CI environment, sym-link won't be created for hooks"
  echo "$CI_VARS" | while IFS= read -r var ; do echo "  - $var"; done
fi
