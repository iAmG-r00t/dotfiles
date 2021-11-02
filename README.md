# .dotfiles 🗃  repo

- Replacement of the main [dotfiles](https://github.com/iAmG-r00t/dotfiles) repository.
- Basically I will start building this repository bit by bit.

---

## Quick Grab dotfiles

- You can get the updated dotfiles from the following [onliners](./quickgrab.md).

## Server Setup 

### Basic Vanilla Bash and VIM setup. 🍽

- Simple basic server set-up script.
  - Installs several tools; `fzf`, `bat`, `tmux` and `mosh`.
  - Setups tmux and bash configuration files.
  - Does some few cleanups.

- Run this command to install and setup up basic vanilla setup that I mainly use in new server setups.

  ```sh
  curl -fsSL https://raw.githubusercontent.com/iAmG-r00t/.dotfiles/main/server/servers.sh | bash
  ```
- Run this command to setup basic vanilla vim setup.

  ```sh
  curl -fsSL https://raw.githubusercontent.com/iAmG-r00t/.dotfiles/main/server/vim.sh | bash
  ```

## Desktop Setup

- [Essentials script](./desktop/essentials.sh) set's up the pc for a normal day to day use.
	- [Read more](./essentials.md) on what exactly it installs or you read the script.
  ```sh
  curl -fsSL https://raw.githubusercontent.com/iAmG-r00t/.dotfiles/main/desktop/essentials.sh | bash
  ```

- [Others](./desktop/others.md) is a file that contains applications that you will be required to install manually either from the os store (**Pop OS** == ***Pop Shop***) or from [here](https://google.com). I would love to note that Pop Shop is up to date and that's why I love it so much and it has two options either flatpak or deb files.

- [Modules](./desktop/modules) scripts.

# To Do:

## on Automation

- [ ] Dotfiles setup.
- [x] Docker install
- [ ] Backup setup and script sync with backblaze.

## Docs / files

- [ ] Update dotfiles accordingly.
- [ ] Update server script install *vim* & *tmux* section.
- [ ] Create a script manual/script that will have a menu to choose what to install.
- [ ] Check if I have missed anything from the previous setup and bring it here.
