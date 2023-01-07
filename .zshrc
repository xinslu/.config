# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### EXPORTS ###
export IDF_PATH=~/esp/esp-idf
export PATH="$IDF_PATH/tools:/opt/ti/uniflash_4.6.0/deskdb/content/TICloudAgent/linux/ccs_base/DebugServer/bin:/opt/gcc-arm-none-eabi-9-2019-q4-major/bin:/home/kinshukphalke/.config/networkmanager-dmenu-2.1.0/networkmanager_dmenu:/home/kinshukphalke/greenclip:/home/kinshukphalke/.local/bin:$PATH:/opt"
export VISUAL=nvim
export EDITOR=nvim
export PKG_CONFIG_PATH="/usr/local/lib/arm-none-eabi/pkgconfig:$PKG_CONFIG_PATH"
export ACLOCAL_PATH="/usr/local/share/aclocal:$ACLOCAL_PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward


### CONFIGS ###
TREE_IGNORE="cache|log|logs|node_modules|vendor"
SAVEHIST=10000
HISTFILE=~/.zsh_history

### ALIASES ###
alias grouch="python ~/Documents/grouch/src/tracker.py fall"
alias cn="cd ~/.config/nvim && nvim ~/.config/nvim/init.lua"
alias wiki="cd ~/vimwiki/ && nvim index.wiki"
alias circuitsim='java  --module-path /usr/lib/jvm/java-19-openjdk/lib/javafx.base.jar:/usr/lib/jvm/java-19-openjdk/lib/javafx.controls.jar:/usr/lib/jvm/java-19-openjdk/lib/javafx.graphics.jar --add-modules=javafx.controls -jar ~/Downloads/CircuitSim1.8.2.jar' alias gcam="git commit -am" alias gaa="git add ."
alias gp="git push"
alias todo="cd ~/vimwiki/ && nvim todos/todo.wiki"
alias r="ranger"
alias e="exa"
alias n="nvim"
alias ls='ls --color=auto'

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
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


### PLUGINS ###
source /home/kinshukphalke/zsh-history-substring-search/zsh-history-substring-search.zsh
source /home/kinshukphalke/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### SYNTAX HIGHLIIGHTING ###
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=#5fd700,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=#5fd700,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=#5fd700


export LF_ICONS="\
fi=:\
di=:\
ln=:\
pi=|:\
so=ﯲ:\
db=:\
cd=c:\
or=:\
su=:\
sg=:\
tw=:\
ow=w:\
st=:\
ex=:\
*.7z=:\
*.a=:\
*.aac=:\
*.ace=:\
*.ai=:\
*.alz=:\
*.apk=:\
*.arc=:\
*.arj=:\
*.asf=:\
*.asm=:\
*.asp=:\
*.au=:\
*.aup=:\
*.avi=:\
*.avi=:\
*.bash=:\
*.bat=:\
*.bmp=:\
*.bz2=:\
*.bz=:\
*.c++=:\
*.c=:\
*.cab=:\
*.cbr=:\
*.cbz=:\
*.cc=:\
*.cgm=:\
*.class=:\
*.clj=:\
*.cljc=:\
*.cljs=:\
*.cmake=:\
*.cmd=:\
*.coffee=:\
*.conf=:\
*.cp=:\
*.cpio=:\
*.cpp=:\
*.cs=:\
*.css=:\
*.cue=:\
*.cvs=:\
*.cxx=:\
*.d=:\
*.dart=:\
*.db=:\
*.deb=:\
*.diff=:\
*.dl=:\
*.dll=:\
*.doc=:\
*.docx=:\
*.dump=:\
*.dwm=:\
*.dz=:\
*.ear=:\
*.edn=:\
*.eex=:\
*.efi=:\
*.ejs=:\
*.elf=:\
*.elm=:\
*.emf=:\
*.epub=:\
*.erl=:\
*.esd=:\
*.ex=:\
*.exe=:\
*.exs=:\
*.f#=:\
*.fifo=|:\
*.fish=:\
*.flac=:\
*.flc=:\
*.fli=:\
*.flv=:\
*.flv=:\
*.fs=:\
*.fsi=:\
*.fsscript=:\
*.fsx=:\
*.gem=:\
*.gif=:\
*.git=:\
*.gl=:\
*.go=:\
*.gz=:\
*.gzip=:\
*.h=:\
*.hbs=:\
*.hh=:\
*.hpp=:\
*.hrl=:\
*.hs=:\
*.htaccess=:\
*.htm=:\
*.html=:\
*.htpasswd=:\
*.ico=:\
*.img=:\
*.ini=:\
*.iso=:\
*.jar=:\
*.java=:\
*.jl=:\
*.jpeg=:\
*.jpg=:\
*.js=:\
*.json=:\
*.jsx=:\
*.key=:\
*.less=:\
*.lha=:\
*.lhs=:\
*.log=:\
*.lrz=:\
*.lua=:\
*.lz4=:\
*.lz=:\
*.lzh=:\
*.lzma=:\
*.lzo=:\
*.m2v=:\
*.m4a=:\
*.m4v=:\
*.markdown=:\
*.md=:\
*.mid=:\
*.midi=:\
*.mjpeg=:\
*.mjpg=:\
*.mka=:\
*.mkv=:\
*.ml=λ:\
*.mli=λ:\
*.mng=:\
*.mov=:\
*.mp3=:\
*.mp4=:\
*.mp4v=:\
*.mpc=:\
*.mpeg=:\
*.mpg=:\
*.msi=:\
*.mustache=:\
*.nix=:\
*.nuv=:\
*.o=:\
*.oga=:\
*.ogg=:\
*.ogm=:\
*.ogv=:\
*.ogx=:\
*.opus=:\
*.pbm=:\
*.pcx=:\
*.pdf=:\
*.pgm=:\
*.php=:\
*.pl=:\
*.pm=:\
*.png=:\
*.ppk=:\
*.ppm=:\
*.ppt=:\
*.pptx=:\
*.pro=:\
*.ps1=:\
*.psb=:\
*.psd=:\
*.pub=:\
*.py=:\
*.pyc=:\
*.pyd=:\
*.pyo=:\
*.qt=:\
*.ra=:\
*.rar=:\
*.rb=:\
*.rc=:\
*.rlib=:\
*.rm=:\
*.rmvb=:\
*.rom=:\
*.rpm=:\
*.rs=:\
*.rss=:\
*.rtf=:\
*.rz=:\
*.s=:\
*.sar=:\
*.scala=:\
*.scss=:\
*.sh=:\
*.slim=:\
*.sln=:\
*.so=:\
*.spx=:\
*.sql=:\
*.styl=:\
*.suo=:\
*.svg=:\
*.svgz=:\
*.swm=:\
*.t7z=:\
*.t=:\
*.tar=:\
*.taz=:\
*.tbz2=:\
*.tbz=:\
*.tga=:\
*.tgz=:\
*.tif=:\
*.tiff=:\
*.tlz=:\
*.ts=:\
*.twig=:\
*.txz=:\
*.tz=:\
*.tzo=:\
*.tzst=:\
*.vim=:\
*.vimrc=:\
*.vob=:\
*.war=:\
*.wav=:\
*.wav=:\
*.webm=:\
*.wim=:\
*.wmv=:\
*.xbm=:\
*.xbps=:\
*.xcf=:\
*.xhtml=:\
*.xls=:\
*.xlsx=:\
*.xml=:\
*.xpm=:\
*.xspf=:\
*.xul=:\
*.xwd=:\
*.xz=:\
*.yaml=:\
*.yml=:\
*.yuv=:\
*.z=:\
*.zip=:\
*.zoo=:\
*.zsh=:\
*.zst=:\
*.src=:\
*.ebuild=:\
"

### TROLLING ###:/
alias bruh='echo  "Deleting / :gwbruhtrolled:"'
