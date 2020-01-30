# Casey Flynn <cflynn.us@gmail.com>
# January 18, 2019

export WORKSPACE_DIR=$HOME/Dropbox/workspace
for source_target in $WORKSPACE_DIR/dotfiles/shell-functions/*.sh; do
  source "$source_target"
done

alias git='hub'
alias vim='nvim'
alias python=/usr/local/bin/python3
alias pip=/usr/local/bin/pip3

# tmux
export TERM="xterm-256color"
source /Users/$USER/antigen.zsh

# open vim when entering visual mode for easier long command editing
bindkey -M vicmd v edit-command-line
EDITOR=/usr/local/bin/nvim

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle Dbz/kube-aliases

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# My personal bundles
antigen bundle zsh-users/zsh-autosuggestions

# Powerlevel9k configuration
POWERLEVEL9K_MODE='nerdfont-complete' # Required by powerlevel9k
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(kubecontext dir vcs status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode background_jobs)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='dodgerblue2'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='black'
POWERLEVEL9K_DIR_ETC_BACKGROUND='dodgerblue2'
POWERLEVEL9K_DIR_ETC_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_BACKGROUND='dodgerblue2'
POWERLEVEL9K_DIR_HOME_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='dodgerblue2'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='dodgerblue2'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='white'

POWERLEVEL9K_TIME_ICON=''
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''

POWERLEVEL9K_TIME_FORMAT="%D{%H:%M %d/%m/%y}"
POWERLEVEL9K_TIME_FORMAT=""
antigen theme bhilburn/powerlevel9k

# Tell Antigen that you're done.
antigen apply

# Change zsh line editing module (zle) to use vi mode
export KEYTIMEOUT=1
bindkey -v

PATH=$PATH:$HOME/go/bin
PATH=$PATH:/Applications/MySQLWorkbench.app/Contents/MacOS
export PATH

# Prevent terminal from auto renaming tab titles
export DISABLE_AUTO_TITLE="true"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/casey/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/casey/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/casey/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/casey/google-cloud-sdk/completion.zsh.inc'; fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source /Users/casey/Library/Preferences/org.dystroy.broot/launcher/bash/br

# Set 'bat' as a color visualizor manpage viewer
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
