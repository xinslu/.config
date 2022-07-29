if status is-interactive
    set -Ux EDITOR nvim
    set -Ux VISUAL nvim
    set --erase fish_greeting
    alias python="python3"
    set node_options --openssl-legacy-provider 
end
starship init fish | source

