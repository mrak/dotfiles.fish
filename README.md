To use, clone to `~/.config/fish` and run `make` to download any plugin
submodules.

I have `/bin/sh` set as my user login shell. My `~/.profile` is used upon login
and a `~/.config/sh/env` is sourced for interative shells, which does `exec fish`.
This avoids any issues with your login shell or `SHELL` being non-POSIX.

```shell
# ~/.profile
# If the shell is interactive, this file will be sourced, too.
# Make sure this file is private: `chmod 600 $ENV`
ENV="${HOME}/.conifg/sh/env"

# Cache the result of `uname` (it never changes) instead of
# needing to repeatedly invoke it in scripts.
UNAME="$(uname)"

export ENV UNAME
```

```shell
# ~/.config/sh/env
if expr "$0" : '^-' >/dev/null; then
  exec fish -l
else
  exec fish
fi
```
