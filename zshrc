export EDITOR="vim"
export BROWSER="vivaldi-stable"

export TERM=gnome-256color

export ZSH="/home/mc/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

source ~/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle git-auto-fetch

antigen bundle aliases

# antigen bundle themes
# antigen bundle emoji-clock
antigen bundle dotenv
antigen bundle fzf
antigen bundle command-not-found
# antigen bundle term_tab

antigen bundle kubectl
antigen bundle docker
antigen bundle docker-compose

antigen bundle golang

antigen bundle agkozak/zsh-z
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# antigen bundle ellie/atuin@main
# antigen bundle atuinsh/atuin@main

antigen theme spaceship-prompt/spaceship-prompt
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# antigen theme candy

antigen apply
#
# Install rustup if it isn't installed already
if ! [[ -s "${HOME}/.rustup" ]]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path -y
fi

alias gcd="git checkout dev"
alias gap="git add -p"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export GO111MODULE="on"
export GOBIN=$HOME/go/bin
export PATH=$PATH:$GOBIN

export PATH=$PATH:/home/mc/bin:/home/mc/go/workspace/bin:/bin:/home/mc/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/local/snap/bin:/var/lib/snapd/snap/bin:/snap/bin
export PATH=$PATH:/home/mc/.composer/vendor/bin
export PATH=$PATH:/sbin:/usr/sbin

export RUSTUP_HOME=$HOME/.rustup
export CARGO_HOME=$HOME/.cargo
export PATH=$CARGO_HOME/bin:$PATH

export PNPM_HOME="/home/mc/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

export ENCORE_INSTALL="/home/mc/.encore"
export PATH="$ENCORE_INSTALL/bin:$PATH"

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$DOTNET_ROOT:$PATH
export PATH=$DOTNET_ROOT/tools:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mc/google-cloud-sdk/path.zsh.inc' ]; then . '/home/mc/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/home/mc/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/mc/google-cloud-sdk/completion.zsh.inc'; fi

# source <(kubectl completion zsh)

bindkey '^H' backward-kill-word

# Tokei on cd'ing into a repo
LAST_REPO=""
cd() {
  builtin cd "$@"
  git rev-parse 2>/dev/null

  if [ $? -eq 0 ]; then
    if [ "$LAST_REPO" != $(basename $(git rev-parse --show-toplevel)) ]; then
      tokei
      LAST_REPO=$(basename $(git rev-parse --show-toplevel))
    fi
  fi
}

# requries crates to be installed

alias exa="exa --git --icons --group-directories-first --classify --long --all --header"

tree() {
  exa --tree --git-ignore --ignore-glob=".git|node_modules" --level=${1:=3}
}

# aliases

# copy
copy() {
  xclip -selection clipboard
}

# find N-largest files
large() {
  find . -type f -printf '%s %P\n' | du -bh 2>/dev/null | sort -nr | head -${1:=10}
}

set-wall() {
  img=$1
  swww img $img
  wal -i $img
}

# unalias ll
# ll is exa
alias ll="exa"

# grep if needed
# ll() {
#  grep=$1
#  if [[ -z $grep ]]; then
#    exa
#  else
#    exa | grep -i $grep
#  fi
#}

# cats be bats
alias cat="bat"

# Load Angular CLI autocompletion.
# source <(ng completion script)

source "$HOME/.cargo/env"
eval "$(fnm env --use-on-cd)"
eval "$(starship init zsh)"
eval "$(atuin init zsh)"
# eval "$(/opt/homebrew/bin/brew shellenv)"

# wal -R -et
# clear

neofetch
