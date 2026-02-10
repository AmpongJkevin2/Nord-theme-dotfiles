#!/usr/bin/env bash
export XDG_RUNTIME_DIR=${TMPDIR}
export WLR_RENDERER=pixman
am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity

termux-x11 -xstartup "sway"
