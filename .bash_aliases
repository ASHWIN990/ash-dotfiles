#	______  ___   _____ _   _             ___  _ _                     
#	| ___ \/ _ \ /  ___| | | |           / _ \| (_)                    
#	| |_/ / /_\ \\ `--.| |_| |  ______  / /_\ \ |_  __ _ ___  ___  ___ 
#	| ___ \  _  | `--. \  _  | |______| |  _  | | |/ _` / __|/ _ \/ __|
#	| |_/ / | | |/\__/ / | | |          | | | | | | (_| \__ \  __/\__ \
#	\____/\_| |_/\____/\_| |_/          \_| |_/_|_|\__,_|___/\___||___/
#
# ~/.bash_aliases
#

alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias cp="cp -i"                          # confirm before overwriting something
alias rm="rm -v"						  # explain what is being done
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='/usr/bin/nano -w PKGBUILD'
alias more=less
alias ls='/usr/bin/exa -l --color=always --group-directories-first --icons' # my preferred listing
alias la='/usr/bin/exa -alh --color=always --group-directories-first --icons'  # all files and dirs
alias ll='/usr/bin/exa -Ga --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias noofline="wc -l"
alias psof="ps aux | grep "
alias micro="/home/ashwini/.local/bin/micro"
alias cat="bat --theme=ansi-dark"
alias less="bat --theme=ansi-dark"
alias simple-bash="export PS1='\\$\[$(tput sgr0)\] ' && alias ls='exa --icons'"
alias pdf-viewer="epdfview"
alias mpv="swallow mpv"
alias feh="swallow feh"
alias ccopy='xclip -selection clipboard'
alias cpaste='xclip -selection clipboard -o'
alias nano="echo -e '\e[1;7;92mYOUR EDITOR IS 'MICRO'\e[0m'"
alias youtube-dl-sample="echo -e 'youtube-dl -f 'bestvideo+bestaudio/bestvideo+bestaudio' video-link'"
