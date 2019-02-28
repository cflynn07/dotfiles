# Casey Flynn <cflynn.us@gmail.com>
# January 18, 2019

source /Users/caseyflynn/antigen.zsh

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
# Fura Code Retina Nerd Font Complete Mono
# https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Retina/complete/Fura%20Code%20Retina%20Nerd%20Font%20Complete%20Mono.otf
POWERLEVEL9K_MODE='nerdfont-complete' # Required by powerlevel9k
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(kubecontext dir vcs status)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator vi_mode time)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
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

alias git='hub'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/caseyflynn/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/caseyflynn/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/caseyflynn/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/caseyflynn/google-cloud-sdk/completion.zsh.inc'; fi

export PATH=$PATH:~/go/bin
