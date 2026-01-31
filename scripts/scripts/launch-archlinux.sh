#!/usr/bin/env bash

am start --user 0 -n com.termux.x11/com.termux.x11.MainActivity

#proot-distro login archlinux --shared-tmp -- /bin/bash -c 'termux-x11 -xstartup "i3"'
proot-distro login archlinux --bind $HOME:/root --shared-tmp -- /bin/bash -c 'termux-x11 -xstartup "i3"'

