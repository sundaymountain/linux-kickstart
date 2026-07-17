#!/usr/bin/env bash
#
# Linux Kickstart - Post-installation setup for Ubuntu
# Usage: curl -fsSL https://raw.githubusercontent.com/<USER>/linux-kickstart/main/setup.sh | bash
#
set -euo pipefail

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'
log()  { echo -e "${GREEN}[✓]${NC} $1"; }
warn() { echo -e "${YELLOW}[!]${NC} $1"; }
err()  { echo -e "${RED}[✗]${NC} $1"; }

setup_packages() {
    log "Updating package lists..."
    sudo apt update -y

    log "Installing packages..."
    sudo apt install -y \
        neovim \
        lsb-release \
        gnupg \
        dconf-cli \
        build-essential \
        procps \
        curl \
        file \
        gnome-terminal \
        zoxide \
        ripgrep \
        fd-find \
        fzf \
        bat \
        tmux \
        htop \
        btop

    log "Installing Docker..."
    if ! command -v docker &>/dev/null; then
        curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
        sudo sh /tmp/get-docker.sh
        sudo usermod -aG docker "$USER"
        warn "You'll need to log out and back in for Docker group changes to take effect."
    else
        log "Docker already installed, skipping."
    fi

    log "Installing Homebrew..."
    if ! command -v brew &>/dev/null; then
        NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> "$HOME/.profile"
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    else
        log "Homebrew already installed, skipping."
    fi

    log "Configuring zoxide..."
    echo 'eval "$(zoxide init bash)"' >> "$HOME/.bashrc"
}

setup_aliases() {
    log "Appending aliases to ~/.bashrc..."

    cat >> "$HOME/.bashrc" << 'EOF'

# ---------- Linux Kickstart Aliases ----------
set -o vi

## apt helpers
alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias install='sudo apt install'
alias remove='sudo apt remove'
alias search='apt search'
alias pkgsearch='apt list'
alias flsearch='apt search'
alias pkglist='apt list --installed'
alias pkgshow='apt show'

## safety
alias rm='rm -I --preserve-root'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

## ls
alias ll='ls -lah --color=always --group-directories-first'

## disk usage
alias usage='du -ch | grep total'
alias totalusage='df -hl --total | grep total'
alias partusage='df -hlT --exclude-type=tmpfs --exclude-type=devtmpfs'
alias most='du -hsx * | sort -rh | head -10'

## tools
alias v='nvim'
alias c='clear'
alias h='htop'
alias hh='btop'
alias hg='history | grep $1'
alias t='tmux'
alias rg='ripgrep'
alias f='fd'
alias ff='fzf'
alias g='grep'
alias bat='/bin/batcat'

## git
alias g='git'
alias gs='git status'
alias ga='git add'
alias ga.='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gpull='git pull'
alias gco='git checkout'
alias gb='git branch'
alias gd='git diff'
alias gl='git log --oneline'

## apps (override with your preferred launcher)
alias q='qutebrowser'
alias y='yazi'
# -------------------------------------------
EOF

    log "Aliases appended. Restart your shell or run: source ~/.bashrc"
}

main() {
    echo "========================================"
    echo "  Linux Kickstart - Ubuntu Setup"
    echo "========================================"
    echo ""

    setup_packages
    setup_aliases

    echo ""
    log "All done! System is ready to rock."
}

main "$@"
