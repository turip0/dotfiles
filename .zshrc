#!/usr/bin/env zsh
# ---------------------- HISTORY SETTINGS ----------------------
unset HISTFILE
HISTSIZE=4999
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"
# ---------------------- BASIC ALIASES ----------------------
#scripts#
alias dots="bash ~/.scripts/git.sh"
alias trapeza="bash ~/.scripts/www/trapeza.sh"
alias otw="bash ~/.scripts/www/otw.sh"
alias todo='python3 /home/turip/downloads/hydrotodo.py'
alias qqe="bash /home/turip/.scripts/qqe.sh"
alias cache='bash /home/turip/.scripts/cache.sh'
alias du="bash /home/turip/.scripts/du.sh"

#basic#
alias tree='tree -C'
alias la='lsd --all --sizesort'
alias ls='lsd --sizesort'
alias ..="cd .."
alias ...="cd ../.."
alias /='cd /'
alias rm='rm -r'
alias unrar='unrar-free'
alias icat="kitten icat"
alias mkdir='mkdir -p'

#extra#
alias sourcez="source /home/turip/.zshrc"
alias fonts="fc-list : family"
alias trash='sudo rm -rf /home/.Trash-0'

#pass#
alias pass-update='pass git push -u --all'
alias pass-key='gpg --list-secret-keys'

#quick#
alias q='exit'
alias cc='clear'
alias d="~/.cargo/bin/dott-tui -C ~/.config/dott/config.toml"

#packages#
alias s='sudo pacman -S'
alias r='sudo pacman -Rns'
alias ss="yay -S"
alias yaya='yay'

#cd#
alias scripts="cd ~/.scripts"
alias conf='cd ~/.config'
alias hypr='cd ~/.config/hypr/'
alias unorg="cd ~/unorg"

#programs#
alias timer='tclock --color magenta timer -d'
alias clock='tclock --color magenta'
alias fetch="fastfetch --kitty-icat ~/.config/fastfetch/gengar.gif"
alias wordle='clidle'
alias yt="gophertube -d ~/unorg/"
alias chess='chess-tui -l lip_GxzwKvkEQBE0VDhe6qbW -e "/usr/bin/gnuchess --uci"'
alias mines="tui-mines"
alias www="cha -V"
alias ytdl="youtube-dl --no-cache-dir"
alias z='fzf -m --preview="bat --color=always {}"'
alias pipes='pipes.sh -t 1'
alias zvim='nvim $(z)'
alias discordo='DISCORDO_TOKEN="OTEzMDc2MzM2MTc4OTA1MDk5.G7lo9x.UEO7_-eh_Rc08V9Thb7_mg0CtGrNOMNeW-scws" discordo'
alias bluetooth='bluetui'

#edit#
alias nv="nvim"
alias editz='nvim ~/.zshrc'
alias edithypr='nvim ~/.config/hypr/hyprland.conf'
#----------------------ENVIRONMENT----------------------------------
export EDITOR="nvim"
export VISUAL="nvim"
export PASSWORD_STORE_CLIP_TIME=120
#----------------------SETUP-TOOLS---------------------------------
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
export PATH="$PATH:~/.cargo/bin" 
  source <(fzf --zsh)
  eval "$(starship init zsh)"
#---------------------------------------------------------------------------
#kitten icat --align left ~/.config/fastfetch/gengar.gif 
d
