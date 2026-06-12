#!/bin/bash
source ~/.bash_profile
source ~/.keychain/$HOSTNAME-sh

inotifywait -m -r -e close_write ~/.config/hypr/ |
while read path action file; do
	if [[ "$file" == *.conf ]]; then
		echo "$read $action $file $HYPER_GIT_DIR"
    		cp "${path}${file}" "$HYPR_GIT_DIR/"
    		cd $HYPR_GIT_DIR
    		git add "$file"
    		git commit -m "auto: $file updated $(date +%Y-%m-%d-%H:%M:%S)"
    		git push
    	fi
done
