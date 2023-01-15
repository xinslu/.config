source ~/zsh-autocomplete/zsh-autocomplete.plugin.zsh

### EXPORTS ###
export IDF_PATH=~/esp/esp-idf
export PATH="$HOME/go/bin:$IDF_PATH/tools:/opt/ti/uniflash_4.6.0/deskdb/content/TICloudAgent/linux/ccs_base/DebugServer/bin:/opt/gcc-arm-none-eabi-9-2019-q4-major/bin:/home/kinshukphalke/.config/networkmanager-dmenu-2.1.0/networkmanager_dmenu:/home/kinshukphalke/greenclip:/home/kinshukphalke/.local/bin:$PATH:/opt"
export PKG_CONFIG_PATH="/usr/local/lib/arm-none-eabi/pkgconfig:$PKG_CONFIG_PATH"
export ACLOCAL_PATH="/usr/local/share/aclocal:$ACLOCAL_PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


### CONFIGS ###
TREE_IGNORE="cache|log|logs|node_modules|vendor"
SAVEHIST=10000
HISTFILE=~/.zsh_history

### ALIASES ###
alias grouch="python ~/Documents/grouch/src/tracker.py spring"
alias cn="cd ~/.config/nvim && nvim ~/.config/nvim/init.lua"
alias wiki="cd ~/vimwiki/ && nvim index.wiki"
alias circuitsim='java  --module-path /usr/lib/jvm/java-19-openjdk/lib/javafx.base.jar:/usr/lib/jvm/java-19-openjdk/lib/javafx.controls.jar:/usr/lib/jvm/java-19-openjdk/lib/javafx.graphics.jar --add-modules=javafx.controls -jar ~/Downloads/CircuitSim1.8.2.jar' alias gcam="git commit -am" alias gaa="git add ."
alias gp="git push"
alias todo="cd ~/vimwiki/ && nvim todos/todo.wiki"
alias r="lfcd"
alias e="exa"
alias n="nvim"
alias ls='ls --color=auto'
alias gs='git status'
alias tabbed-st="tabbed -r 2 st -w ''"
alias weather="curl 'wttr.in/Atlanta?m'"
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

### EVALS ###
eval $(thefuck --alias)
eval $(env TERM=xterm256-color dircolors)

### OPTIONS ###
unsetopt menu_complete
unsetopt flow_control
setopt prompt_subst
setopt always_to_end
setopt append_history
setopt auto_menu
setopt complete_in_word
setopt hist_ignore_dups

### PROMPT ###
function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="%F{blue} %B%~%b%f %F{8}\$(parse_git_branch)%f %F{green}➜%f "

### PLUGINS ###
source /home/kinshukphalke/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/kinshukphalke/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

## LF ###
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
