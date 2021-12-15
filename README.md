# My dotfiles 🗃

- Replacement of the main [dotfiles](https://github.com/iAmG-r00t/dotfiles/tree/oldotfiles) repository.
- Basically this is a long life project.

Branch Hierarchy
----------------

```
master
|
+- dotbot [gitsubmodule, dotfiles bootstrap]
|
+- desktop
|    |
|    +- modules
|    +- dotfiles
|         |
|         +- bash
|         +- eddie
|         +- vim [! simple configs]
|         +- workspaces [tmux workspaces]
|         +- tmux.conf
|    +- essentials.sh [install script]
|    +- others.md [Apps & Extensions]
+- server
|    |
|    +- vim [simple configs]
|    +- bashrc
|    +- tmux.conf
|    +- servers.sh [install script]
|    +- vim.sh [install script]
+- quickgrab.md [oneliners]
+- install.conf.yaml [dotbot install config file]
+- template.sh [bash script template]

oldotfiles [inactive]
```

---

Quick Grab dotfiles
-------------------

- You can get the updated dotfiles from the following [onliners](./quickgrab.md).

Server Setup 🍽
---------------

- Simple basic server set-up script.
  - Installs several tools; `fzf`, `bat`, `tmux` and `mosh`.
  - Setups tmux and bash configuration files.
  - Does some few cleanups.

- Run this command to install and setup up basic vanilla setup that I mainly use in new server setups.

  ```sh
  curl -fsSL https://raw.githubusercontent.com/iAmG-r00t/.dotfiles/master/server/servers.sh | bash
  ```
- Run this command to setup basic vanilla vim setup.

  ```sh
  curl -fsSL https://raw.githubusercontent.com/iAmG-r00t/.dotfiles/master/server/vim.sh | bash
  ```

Desktop Setup 🍽
----------------

- [Essentials script](./desktop/essentials.sh) set's up the pc for a normal day to day use.
	- For more information on desktop setup read [here](./desktop/README.md).
  ```sh
  curl -fsSL https://raw.githubusercontent.com/iAmG-r00t/.dotfiles/master/desktop/essentials.sh | bash
  ```
