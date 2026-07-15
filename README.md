# Linux Kickstart 🚀

One-command post-installation setup for **Ubuntu** (laptop, desktop, or WSL).

## Quick Install

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/sundaymountain/linux-kickstart/main/setup.sh)
```

## What it installs

| Package         | Purpose                          |
|-----------------|----------------------------------|
| **neovim**      | Modern Vim-based editor          |
| **docker**      | Container runtime                |
| **zoxide**      | Smarter `cd` command             |
| **brew**        | Homebrew package manager         |
| **build-essential** | Compilers & dev tools        |
| gnupg           | GPG encryption                   |
| dconf-cli       | GNOME settings CLI               |
| procps          | Process utilities                |
| curl            | HTTP transfers                   |
| file            | File type detection              |
| gnome-terminal  | Terminal emulator                |
| lsb-release     | Distro metadata                  |

## Included Aliases

| Alias       | Command                                      |
|-------------|----------------------------------------------|
| `v`         | `nvim`                                       |
| `c`         | `clear`                                      |
| `h`         | `history`                                    |
| `hg`        | `history \| grep $1`                         |
| `ll`        | `ls -lah --color=always --group-directories-first` |
| `rm`        | `rm -I --preserve-root`                     |
| `cp`        | `cp -i`                                      |
| `mv`        | `mv -i`                                      |
| `mkdir`     | `mkdir -p`                                   |
| `update`    | `sudo apt update`                            |
| `upgrade`   | `sudo apt upgrade`                           |
| `remove`    | `sudo apt remove`                            |
| `usage`     | `du -ch \| grep total`                      |
| `totalusage`| `df -hl --total \| grep total`              |
| `partusage` | `df -hlT --exclude-type=tmpfs --exclude-type=devtmpfs` |
| `most`      | `du -hsx * \| sort -rh \| head -10`         |
