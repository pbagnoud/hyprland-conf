#!/bin/bash
source $HOME/.bash_profile

VER=${1:-0}

pkill -f watch.sh

git -C "$HYPR_GIT_DIR" checkout "HEAD~$VER" -- .
cp "$HYPR_GIT_DIR/"*.conf "$HOME/.config/hypr/"
git -C "$HYPR_GIT_DIR" checkout HEAD -- .

if [ "$VER" -eq 0 ]; then
	echo "Current .conf files restored"
else
        echo ".conf files restored from $VER commits ago" 
fi
bash "$HYPR_GIT_DIR"/watch.sh > /dev/null 2>&1 &
disown

echo "automatic git commit restarted!"
