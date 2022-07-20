if status is-interactive
    set -gx PATH /Library/Frameworks/Python.framework/Versions/3.9/bin $HOME/.cargo/bin $PATH
    set -Ux EDITOR nvim
    set -Ux VISUAL nvim
    set --erase fish_greeting
    alias python="python3"
end
starship init fish | source
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

