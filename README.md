# Linux Kickstart 🚀

One-command post-installation setup for **Ubuntu** (laptop, desktop, or WSL).

Supports both **bash** and **zsh** — the script prompts you to choose before installing.

## Quick Install

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/sundaymountain/linux-kickstart/main/setup.sh)
```

## What it installs

| Package            | Purpose                          |
|--------------------|----------------------------------|
| **neovim**         | Modern Vim-based editor          |
| **docker**         | Container runtime                |
| **zoxide**         | Smarter `cd` command             |
| **brew**           | Homebrew package manager         |
| **build-essential**| Compilers & dev tools            |
| **ripgrep**        | Blazing-fast code search         |
| **fd-find**        | Fast file find                   |
| **fzf**            | Fuzzy finder                     |
| **bat**            | Syntax-highlighted `cat`         |
| **tmux**           | Terminal multiplexer             |
| **htop**           | Interactive process viewer       |
| **btop**           | Modern resource monitor          |
| gnupg              | GPG encryption                   |
| dconf-cli          | GNOME settings CLI               |
| procps             | Process utilities                |
| curl               | HTTP transfers                   |
| file               | File type detection              |
| gnome-terminal     | Terminal emulator                |
| lsb-release        | Distro metadata                  |
| **zsh**            | Z shell (with optional config)   |
| **eza**            | Modern `ls` replacement           |
| **lazygit**        | Terminal Git UI                   |

## Included Aliases

### apt helpers
| Alias       | Command                            |
|-------------|------------------------------------|
| `update`    | `sudo apt update`                  |
| `upgrade`   | `sudo apt upgrade`                 |
| `install`   | `sudo apt install`                 |
| `remove`    | `sudo apt remove`                  |
| `search`    | `apt search`                       |
| `pkgsearch` | `apt list`                         |
| `flsearch`  | `apt search`                       |
| `pkglist`   | `apt list --installed`             |
| `pkgshow`   | `apt show`                         |

### safety
| Alias    | Command                                  |
|----------|------------------------------------------|
| `rm`     | `rm -I --preserve-root`                  |
| `cp`     | `cp -i`                                  |
| `mv`     | `mv -i`                                  |
| `ln`     | `ln -i`                                  |
| `mkdir`  | `mkdir -pv`                              |

### ls
| Alias | Command                                                |
|-------|--------------------------------------------------------|
| `l`   | `ls --color=always --group-directories-first`          |
| `ll`  | `ls -lah --color=always --group-directories-first`     |

### disk usage
| Alias         | Command                                             |
|---------------|-----------------------------------------------------|
| `usage`       | `du -ch \| grep total`                              |
| `totalusage`  | `df -hl --total \| grep total`                      |
| `partusage`   | `df -hlT --exclude-type=tmpfs --exclude-type=devtmpfs` |
| `most`        | `du -hsx * \| sort -rh \| head -10`                 |

### tools
| Alias | Command              |
|-------|----------------------|
| `v`   | `nvim`               |
| `c`   | `clear`              |
| `h`   | `htop`               |
| `hh`  | `btop`               |
| `hg`  | `history \| grep $1` |
| `hrg` | `history \| ripgrep $1` |
| `t`   | `tmux`               |
| `rg`  | `ripgrep --hidden`   |
| `f`   | `fd`                 |
| `ff`  | `fzf`                |
| `g`   | `grep`               |
| `b`   | `bat --paging=never` |
| `bb`  | `bat`                |
| `e`   | `eza --git --icons --group-directories-first` |
| `ee`  | `eza -l --git --icons --group-directories-first` |

### git
| Alias   | Command              |
|---------|----------------------|
| `gs`    | `git status`         |
| `ga`    | `git add`            |
| `ga.`   | `git add .`          |
| `gc`    | `git commit -m`      |
| `gp`    | `git push`           |
| `gpull` | `git pull`           |
| `gco`   | `git checkout`       |
| `gb`    | `git branch`         |
| `gd`    | `git diff`           |
| `gl`    | `git log --oneline`  |
| `lg`    | `lazygit`            |

### apps
| Alias | Command        |
|-------|----------------|
| `q`   | `qutebrowser`  |
| `y`   | `yazi`         |
