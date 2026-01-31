#!/usr/bin/env bash

# Recommended (with pip due to more control)
pkg install python
pkg install rust # required cause of pydantic

# NOTE: order matters

# get pydantic from the termux user repository
#pip install pydantic --extra-index-url https://termux-user-repository.github.io/pypi/

# the above will take a while if you want to see more output and feel like sth is happening lol
pip install pydantic --extra-index-url https://termux-user-repository.github.io/pypi/ -v

# now you can install viu
pip install viu-media

# === optional deps ===
# if you have reach here awesome lol :)

# yt-dlp for downloading m3u8 and hls streams
pip install yt-dlp[default,curl-cffi]

# you may also need ffmpeg for processing the videos
pkg install ffmpeg

# tip if you also want yt functionality
pip install yt-dlp-ejs

# you require js runtime
# eg the recommended one
pkg install deno

# for faster fuzzy search
pip install thefuzz

# if you want faster scraping, though barely noticeable lol
pip install lxml --extra-index-url https://termux-user-repository.github.io/pypi/

# if compilation fails you need to have
pkg install libxml2 libxslt

# == ui setup ==
pkg install fzf

# then enable fzf in the config
viu --selector fzf config --update

# if you want previews as well specify preview option
# though images arent that pretty lol, so you can stick to text over full
viu --preview text config --update

# if you set preview to full you need a terminal image renderer
pkg install chafa

# == player setup ==
# for this you need to strictly install from playstore
# search for mpv or vlc (recommended, since has nicer ui)
# the only limitation is currently its not possible to pass headers to the android players
# through android intents
# so use servers like sharepoint and wixmp
# though this is not an issue when it comes to downloading ;)
# if you have installed using 'pkg' uninstall it

# okey now you are all set, i promise the hussle is worth it lol :)
# posted a video of it working to motivate you
# note i recorded it from waydroid which is android for linux sought of like an emulator(bluestacks for example)
