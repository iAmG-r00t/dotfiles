# Dotfiles Setup Scripts

>Project has been renamed from desktop-setup to dotfiles ⁉ Because they are my dotfiles to be honest.

This script basically setups everything I would do in a new installation, automation is key in productivity :relieved:

Blogpost comming up later ...

**_The project folders;_**

+ **dotfiles**, just look around inside there; Beware hot area here :smirk:
+ **images** (Background and Screen saver) :grin:
+ **wg** folder :unamused:

# Updates

:hatching_chick: I started using i3 also, its a learning curve to configure it but once you get a hang of it you will enjoy it :smile:, just look around the dotfiles folder and figure the rest out :sloth:

## Included `scripts/`
* `dotfiles.sh` sets up all my dotfiles, for `vim`, `tmux`, `bash`, `OMZ` and `etc`
* `wg.sh` sets up wireguard config.. well not needed really but doesn't harm if it still stays there
* `desktop.sh` sets up my desktop enviroment look and feel, this includes icons, images and both folders and folder bookmarks
* `software.sh` installs all my common softwares, it's a long list so don't mind me :bowtie:
* `setup.sh` this brings all the scripts together, and does some finishing touches.
* `sync.sh` sync's my dotfiles to my git repo folder, to commit any changes.


### 2 Look at:
- [Eddie](https://github.com/victoriadrake/eddie-terminal) by [Victoria Drake](https://victoria.dev/)
	:blush: Awesome tool to write messages when you start a new shell, really awesome!!
- [Git-Secret](https://git-secret.io/)
	:raised_hand: Encrypt your secret files/vital files to be able to commit in git repos
- [KeePass](https://keepass.info/)
	:fire: Realy good on handling ssh-keys and working as an SSH Agent
	
# Future Updates

- [ ] Re-write the each scripts into single modules. (I had already done this but, I ended up deleting the whole directory by mistake that made me feel fed up.)
- [ ] Resctructure the whole repository.
- [ ] Add one liner's section for installing some certain tools and my custom `.bashrc`, this would be benefit if I am setting up a new server that I would only prefer to use bash in it.
- [ ] Custom common aliases that I use in a single file, to be deployed in a bash enviroment.
- [ ] Other things that I will think of in the future ...
