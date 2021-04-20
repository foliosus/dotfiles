PATH=/opt/homebrew/bin:/usr/local/bin:$PATH:$HOME/.rvm/bin:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:~/scripts:$HOME/bin

# Save the terminal history as a global
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=2000
HISTSIZE=1000

# Set up useful env variables
EDIT="subl -w"
EDITOR="subl -w"
HISTFILESIZE=1000
HISTSIZE=1000
LC_COLLATE=C
LESS="giMsR"
VISUAL=$EDITOR
RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# If not running interactively, don't do anything
if [[ -n $PS1 ]]; then

  set -o ignoreeof
  set -o noclobber
  set -o vi

  # don't put duplicate lines in the history. See bash(1) for more options
  export HISTCONTROL=ignoreboth
  HISTIGNORE="[   ]*:&:bg:fg"

  # enable color support of ls and also add handy aliases
  if [ "$TERM" != "dumb" ]; then
    alias ls='ls -FG'
  fi

  alias   cc="gcc"
  alias   l='ls -l'
  alias   ll='ls -lA'
  alias   vi="vim"
  alias   be="bundle exec "
  alias   zt="zeus test "

  # Tell ZSH to use fancy autocompletion
  zstyle ':completion:*' completer _complete _ignored _approximate
  zstyle ':completion:*' max-errors 2
  zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.zsh
  zstyle :compinstall filename '/Users/brent/.zshrc'
  autoload -Uz compinit && compinit
  autoload bashcompinit && bashcompinit

  # Load version control information for the prompt
  autoload -Uz vcs_info
  precmd() { vcs_info }
  # Format the vcs_info_msg_0_ variable
  zstyle ':vcs_info:git:*' formats ' (%b)'

  # Set up the prompt (with git branch name)
  setopt PROMPT_SUBST
  PROMPT='%~%F{cyan}${vcs_info_msg_0_}%F{green} %% %F{white}'

  # Initialize rbenv
  eval "$(rbenv init -)"

  # Initialize nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
