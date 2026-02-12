#!/usr/bin/env zsh
rm -rf ~/Thunderbird/
# ---------------------- HISTORY SETTINGS ----------------------
unset HISTFILE
HISTSIZE=4999
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# ---------------------- BASIC ALIASES ----------------------
alias la='lsd --all --sizesort'
alias ls='lsd --sizesort'
alias ..="cd .."
alias ...="cd ../.."
alias H='start-hyprland'
alias q='exit'
alias s='sudo pacman -S'
alias r='sudo pacman -Rns'
alias ss="yay -S"
alias du="sudo du -sh /"
alias unrar='unrar-free'
alias sourcez="source /home/turip/.zshrc"
alias rm='rm -r'
alias bnd='nvim ~/bandit'
alias setb='brightnessctl set'
alias timer='tclock --color magenta timer -d'
alias clock='tclock --color magenta'
alias /='cd /'
alias discordo='DISCORDO_TOKEN="OTEzMDc2MzM2MTc4OTA1MDk5.G7lo9x.UEO7_-eh_Rc08V9Thb7_mg0CtGrNOMNeW-scws" discordo'
alias weather='curl wttr.in'
alias bluetooth='bluetui'
alias bleach='bleachbit --clean --preset'
alias czkawka='bash /home/turip/.scripts/czkawka.sh'
alias cc='clear'
alias wordle='clidle'
alias z='fzf -m --preview="bat --color=always {}"'
alias editz='nvim ~/.zshrc'
alias edithypr='nvim ~/.config/hypr/hyprland.conf'
alias conf='cd ~/.config'
alias hypr='cd ~/.config/hypr/'
alias yaya='yay'
alias www="cha -V"
alias trapeza="bash ~/.scripts/www/trapeza.sh"
alias otw="bash ~/.scripts/www/otw.sh"
alias fonts="fc-list : family"
alias yt="gophertube -d ~/unorg/"
alias todo='python3 /home/turip/downloads/hydrotodo.py'
alias chess='chess-tui -l lip_GxzwKvkEQBE0VDhe6qbW -e "/usr/bin/gnuchess --uci"'
alias mines="tui-mines"
alias decomp= "jkazip -d"
alias mc="cd ~/downloads/xmcl && ./xmcl &"
alias icat="kitten icat"
alias ytdl="youtube-dl --no-cache-dir"
alias mkdir='mkdir -p'
alias update-grub='grub-mkconfig -o /boot/grub/grub.cfg'
alias qqe="bash /home/turip/.scripts/qqe.sh"
alias off="sudo shutdown now"
alias insta='instagram-cli chat  -u anastasiapsalti'
alias trash='sudo rm -rf /home/.Trash-0'
alias cache='bash /home/turip/.scripts/cache.sh'
#------------------------------------------------------------
export EDITOR="nvim"
export VISUAL="nvim"
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

#setup-fzf
  source <(fzf --zsh)
#setup-starship
  eval "$(starship init zsh)"
#setup-Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

#########Atuin################
. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
##############################
kitten icat --align left ~/.config/fastfetch/gengar.gif 
#kitten icat -n --place 50x50@0x0 --align left /home/turip/.config/fastfetch/gengar.gif | fastfetch --logo-width 50 --raw -
