# Quick Grab

- Run the following commands to just get the specific dotfiles.
- **Beware it will rewrite your original code, only use this to update.**

---

- bashrc

  ```sh
  curl -fsSL -o .bashrc https://raw.githubusercontent.com/iAmG-r00t/.dotfiles/main/server/bashrc
  ```

- tmuxconf
  ```sh
  curl -fsSL -o .tmux.conf https://raw.githubusercontent.com/iAmG-r00t/.dotfiles/main/server/tmux.conf
  ```

- vimrc
  ```sh
  curl -fsSL -o ~/.vim/vimrc https://raw.githubusercontent.com/iAmG-r00t/.dotfiles/main/server/vim/vimrc
  ```

## Tools

- Kindly check the [modules directory](./desktop/modules) for any tool you want to install the run this command.

  ```sh
  curl -fsSL https://raw.githubusercontent.com/iAmG-r00t/.dotfiles/main/desktop/modules/----.sh | bash
  ```
