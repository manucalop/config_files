# Bash completions
export BREW_HOME=$(brew --prefix)

# If shell is bash, then load bash completions
if [ -n "$BASH_VERSION" ]; then
  for file in $BREW_HOME/etc/bash_completion.d/*; do
    source $file
  done
fi
