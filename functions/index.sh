#!/bin/bash

# Next Powerline
# Rotate through powerline configurations
#   * mode - full|basic|min predefined powerline configurations
npli=0
npl() {
  if [[ -n "$1" ]]; then
    case "$1" in
      "full")
        npli=0
        ;;
      "basic")
        npli=1
        ;;
      "min")
        npli=2
        ;;
      "micro")
        npli=3
        ;;
      *)
        echo "usage: $0 full|basic|min|micro)"
        return
        ;;
    esac
  else
    npli=$(((npli + 1) % 4))
  fi

  # 0 full powerline prompt
  if [[ $npli -eq 0 ]]; then
    echo "FULL"
    # \shellcheck doesn't know this is zsh not bash
    # shellcheck disable=SC2039
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(kubecontext dir vcs status)
    # shellcheck disable=SC2039
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode background_jobs)
    POWERLEVEL9K_PROMPT_ON_NEWLINE=true

  # 1 right prompt elements removed
  elif [[ $npli -eq 1 ]]; then
    echo "BASIC"
    # \shellcheck doesn't know this is zsh not bash
    # shellcheck disable=SC2039
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
    # shellcheck disable=SC2039
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
    POWERLEVEL9K_PROMPT_ON_NEWLINE=true

  # pretty much everything removed
  elif [[ $npli -eq 2 ]]; then
    echo "MIN"
    # \shellcheck doesn't know this is zsh not bash
    # shellcheck disable=SC2039
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir)
    # shellcheck disable=SC2039
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
    POWERLEVEL9K_PROMPT_ON_NEWLINE=false

  elif [[ $npli -eq 3 ]]; then
    echo "MICRO"
    # \shellcheck doesn't know this is zsh not bash
    # shellcheck disable=SC2039
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=()
    # shellcheck disable=SC2039
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
    POWERLEVEL9K_PROMPT_ON_NEWLINE=false
  fi
  prompt_powerlevel9k_setup
}
