# Hypr Config with automatic upgrade

After a stupid mistake that deleted my hyprland config, I decided it was time to push automatically the modifications of ~/.config/hypr/.
As working with the american keyboard was a pain, I added an emergency recovery cmd.

Feel free to fork to have a back-up for your config. In this case follow this set-up:

## Set-up

If you want to use the bash scripts, start forking/cloning the repo, then do the following:


### Set Up Environement Variables

in ~/.bash-profile, add

´´´
export HYPR_GIT_DIR="path/of/your/git/repo"
RECOVER="$HYPR_GIT_DIR/recovery.sh"
´´´
the first line is there to make the logics of the script work. 
The second is an optional shortcut to recover quickly the config files:
  - `$RECOVER`  will get the current version, if you delete something by mistake.
  - `$RECOVER 1`  will get the previous version, if you broke something by mistake.

Note: You can revert n commits ago with `$RECOVER n` if needed


### Start the watcher automatically at login

Add to your `hyprland.conf`:

```
exec-once=bash "$HYPR_GIT_DIR"/watch.sh 
```

### Authentication

watch.sh has a git push command. Pick your favorite way to connect to your distant repo. 
I choose to connect to GitHub via SSH: in my case, I added to ~/.bash_profile

```
eval $(keychain --eval --agents ssh id_ed25519)
```
