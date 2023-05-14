### EXPORTS ###
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$HOME/go/bin:/home/kinshukphalke/.local/bin:$PATH:/opt:$HOME/.cargo/bin"
export ACLOCAL_PATH="/usr/local/share/aclocal:$ACLOCAL_PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


### CONFIGS ###
TREE_IGNORE="cache|log|logs|node_modules|vendor"
SAVEHIST=10000
HISTFILE=~/.zsh_history

### ALIASES ###
alias grouch="python ~/Documents/grouch/src/tracker.py fall"
alias cn="cd ~/.config/nvim && nvim ~/.config/nvim/init.lua"
alias wiki="cd ~/vimwiki/ && nvim index.wiki"
alias circuitsim='java  --module-path /usr/lib/jvm/java-19-openjdk/lib/javafx.base.jar:/usr/lib/jvm/java-19-openjdk/lib/javafx.controls.jar:/usr/lib/jvm/java-19-openjdk/lib/javafx.graphics.jar --add-modules=javafx.controls -jar ~/Downloads/CircuitSim1.8.2.jar'
alias gcam="git commit -am"
alias gaa="git add ."
alias gp="git push"
alias todo="cd ~/vimwiki/ && nvim todos/todo.wiki"
alias r="lfcd"
alias e="exa --group-directories-first"
alias n="nvim"
alias aloha="ls --color=auto -aloh"
alias ls='ls --color=auto'
alias gs='git status'
alias tabbed-st="tabbed -r 2 st -w ''"
alias weather="curl 'wttr.in/Atlanta?m'"
alias ncspot="/home/kinshukphalke/ncspot/target/release/ncspot"
alias rip="shutdown \"now\""
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh


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
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
export PS1="%F{6}%B%~%b%f %F{8}\$(parse_git_branch)%f %F{7}❯%f "
bindkey -e

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

### PLUGINS ###
source /home/kinshukphalke/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

[ -f "/home/kinshukphalke/.ghcup/env" ] && source "/home/kinshukphalke/.ghcup/env" # ghcup-env
