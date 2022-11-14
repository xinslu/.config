export IDF_PATH=~/esp/esp-idf
export PATH="$IDF_PATH/tools:/opt/ti/uniflash_4.6.0/deskdb/content/TICloudAgent/linux/ccs_base/DebugServer/bin:/opt/gcc-arm-none-eabi-9-2019-q4-major/bin:/home/kinshukphalke/.config/networkmanager-dmenu-2.1.0/networkmanager_dmenu:/home/kinshukphalke/greenclip:/home/kinshukphalke/.local/bin:$PATH"
export VISUAL=nvim
export EDITOR=nvim
alias grouch="python ~/Documents/grouch/src/tracker.py fall"
alias cn="cd ~/.config/nvim && nvim ~/.config/nvim/init.lua"
alias circuitsim='java --module-path ~/Downloads/javafx-sdk-18.0.2/lib/ --add-modules=javafx.controls -jar ~/Downloads/CircuitSim1.8.2.jar'
TREE_IGNORE="cache|log|logs|node_modules|vendor"
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward # Set list of themes to pick from when loading at random
alias gcam="git commit -am"
alias gaa="git add ."
alias gp="git push"
export PKG_CONFIG_PATH="/usr/local/lib/arm-none-eabi/pkgconfig:$PKG_CONFIG_PATH"
export ACLOCAL_PATH="/usr/local/share/aclocal:$ACLOCAL_PATH"
eval $(thefuck --alias)
eval "$(starship init zsh)"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source /home/kinshukphalke/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
SAVEHIST=1000
HISTFILE=~/.zsh_history
