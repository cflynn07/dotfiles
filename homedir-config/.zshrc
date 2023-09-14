# Casey Flynn <cflynn.us@gmail.com>
# January 18, 2019

export WORKSPACE_DIR=$HOME/workspace
for source_target in $WORKSPACE_DIR/dotfiles/shell-functions/*.sh; do
  source "$source_target"
done

alias git='hub'
alias vim='nvim'

# tmux
export TERM="xterm-256color"
source /Users/$USER/antigen.zsh

# open vim when entering visual mode for easier long command editing
bindkey -M vicmd v edit-command-line
EDITOR=/opt/homebrew/bin/nvim

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
# antigen bundle sobolevn/wakatime-zsh-plugin # time monitoring service

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

# By default, there is a 0.4 second delay after you hit the <ESC> key and when
# the mode change is registered. This results in a very jarring and frustrating
# transition between modes. Let's reduce this delay to 0.1 seconds.
export KEYTIMEOUT=1

# Change zsh line editing module (zle) to use vi mode
bindkey -v

#SYSBENCH_TESTS=/usr/local/Cellar/sysbench/1.0.19/share/sysbench
#export SYSBENCH_TESTS

# Set 'bat' as a color visualizor manpage viewer
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Search backwards and forwards with a pattern
bindkey -M vicmd '/' history-incremental-pattern-search-backward
bindkey -M vicmd '?' history-incremental-pattern-search-forward

# set up for insert mode too
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward

# Ignore node_modules
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/caseyflynn/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/caseyflynn/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/caseyflynn/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/caseyflynn/bin/google-cloud-sdk/completion.zsh.inc'; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/caseyflynn/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/caseyflynn/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/caseyflynn/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/caseyflynn/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

PATH=$PATH:$HOME/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
