#	______  ___   _____ _   _           ______                _   _                 
#	| ___ \/ _ \ /  ___| | | |          |  ___|              | | (_)                
#	| |_/ / /_\ \\ `--.| |_| |  ______  | |_ _   _ _ __   ___| |_ _  ___  _ __  ___ 
#	| ___ \  _  | `--. \  _  | |______| |  _| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
#	| |_/ / | | |/\__/ / | | |          | | | |_| | | | | (__| |_| | (_) | | | \__ \
#	\____/\_| |_/\____/\_| |_/          \_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
#
# ~/.bash_functions
#

ex ()
# # ex - archive extractor
# # usage: ex <file>
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

while_loop(){
	#while true; do "$@"; done
	echo -e "\nwhile true; do cmd; done"
}

psaux(){
	ps aux | grep "$@"
}

avlc(){
	avlc_path="/home/ashwini/Media/Videos/Music-Video"
	/usr/bin/nvlc "$avlc_path"
}

sizeof(){
	du -sh "$@"
}

# See the file/directory permission in OCTAL form.
perms(){
	if [[ "$@" == "" ]]; then
		stat -c "%a - %n" *
	else
		stat -c "%a - %n" "$@"
	fi
}

# Backup all config files in github
git-config-backup(){
	if [[ `pwd` == "/home/ashwini" ]]; then
		git status | less
		read -p $'\e[93;1mDo you want to \'GIT commit & push\' OR Press M to edit \'.gitignore\'... \e[1;97m (Y/N/M) \e[93;1m? : \e[0m' yn_gcb
		if [[ "$yn_gcb" == "y" ]] || [[ "$yn_gcb" == "Y" ]]; then
			echo -e "\ngit commit -am $(date)\n" && git commit -am "$(date)"
			echo -e "\ngit push\n" && git push
			echo -e "\nDONE\n"
		elif [[ "$yn_gcb" == "m" ]] || [[ "$yn_gcb" == "M" ]]; then
			micro /home/ashwini/.gitignore
		else
			echo -e "\nWrogn INPUT, Program abborting.....\n"
		fi
	else
		echo -e "\nChange to directory '/home/ashwini'\n"
	fi
}

# Download videos from internet using youtube-dl
youtube-downloader(){
	youtube-dl -f 'bestvideo+bestaudio/bestvideo+bestaudio' "$@"
}

# ASCII ART
ascii-art(){
if [ `(tput cols)` -lt "35" ]; then
	$(echo -e "elfman \ncolorwheel \ncrunchbang-mini" | shuf | head -n 1)
else
	$(echo -e "elfman \npanes \ncolorwheel \ncrunchbang-mini\n pfetch\n ghost" | shuf | head -n 1)
fi
}

# Another CTRL-R script to insert the selected command from history into the command line/region
__fzf_history(){
    builtin history -a;
    builtin history -c;
    builtin history -r;
    builtin typeset \
        READLINE_LINE_NEW="$(
            HISTTIMEFORMAT= builtin history |
            command fzf +s --tac +m -n2..,.. --tiebreak=index --height=30% --toggle-sort=ctrl-r |
            command sed '
                /^ *[0-9]/ {
                    s/ *\([0-9]*\) .*/!\1/;
                    b end;
                };
                d;
                : end
            '
        )";

        if
                [[ -n $READLINE_LINE_NEW ]]
        then
                builtin bind '"\er": redraw-current-line'
                builtin bind '"\e^": magic-space'
                READLINE_LINE=${READLINE_LINE:+${READLINE_LINE:0:READLINE_POINT}}${READLINE_LINE_NEW}${READLINE_LINE:+${READLINE_LINE:READLINE_POINT}}
                READLINE_POINT=$(( READLINE_POINT + ${#READLINE_LINE_NEW} ))
        else
                builtin bind '"\er":'
                builtin bind '"\e^":'
        fi
}

builtin set -o histexpand;
builtin bind -x '"\C-x1": __fzf_history';
builtin bind '"\C-r": "\C-x1\e^\er"'
