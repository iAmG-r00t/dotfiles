# Desktop Setup

- [Modules](./modules) directory contains install scripts.
- [Others](./others.md) is a file that contains applications that you will be required to install manually either from the os store (**Pop OS** == ***Pop Shop***) or from [here](https://google.com). I would love to note that Pop Shop is up to date and that's why I love it so much and it has two options either flatpak or deb files.

- In here you will find the essential script that installs the basic stuff to get you started.
	- Basic vanilla bash
	- If vim is not installed, it will install VIM from github.
	- Install basic tools/apps from the [modules](./modules) directory (will name some, check the rest ...);
		- `tailscale`, `wireguard` & `mulvad`: VPN Service.
        - `ngrok` : provides a real-time web UI where you can introspect all HTTP traffic running over your tunnels.
		- `tmux`: Terminal multiplexer.
		- `mosh`: the mobile shell.
		- `fzf`: A command-line fuzzy finder
		- `bat`: A cat(1) clone with wings.
		- `keepassXC`: Password Manager.
		- `shellcheck`: shell script analysis tool.
		- `betty`: Holberton-style C code checker written in Perl.
		- `valgrind`: an instrumentation framework for building dynamic analysis tools (used to check memory leaks in C programs).
		- `udis86`: Disassembler Library for x86 and x86-64.
