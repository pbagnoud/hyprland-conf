# Hypr Config with automatic upgrade

After a stupid mistake that deleted my hyprland config, I decided it was time to push automatically the modifications of ~/.conf/hypr/.
As working with the american keyboard was a pain, I added an emergency cmd.

Feel free to fork to have a back-up for your config.

## set-up

in ~/.bash-profile, add

´´´
export HYPR_GIT_DIR="path/of/your/git/repo"
RECOVER="$HYPR_GIT_DIR/recovery.sh"
´´´
the first line is there to make the logics of the script work. 
The second is a shortcut to recover quickly the previous version without typing too much
