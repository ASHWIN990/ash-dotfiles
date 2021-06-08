#	  ___   _____ _   _           ______  ___   _____ _   _ 
#	 / _ \ /  ___| | | |          | ___ \/ _ \ /  ___| | | |
#	/ /_\ \\ `--.| |_| |  ______  | |_/ / /_\ \\ `--.| |_| |
#	|  _  | `--. \  _  | |______| | ___ \  _  | `--. \  _  |
#	| | | |/\__/ / | | |          | |_/ / | | |/\__/ / | | |
#	\_| |_/\____/\_| |_/          \____/\_| |_/\____/\_| |_/
#
# ~/.bashrc
#

# Check if terminal is interactive or not
[[ $- != *i* ]] && return

# Get the bash autocompleteion
[[ -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# Source all the aliases
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# Source all the bash functions
[[ -f ~/.bash_functions ]] && . ~/.bash_functions

# Source the bash ps1
[[ -f ~/.bash_ps1 ]] && . ~/.bash_ps1

# Some required stuffs
xhost +local:root > /dev/null 2>&1
complete -cf sudo

# All the shopt switches
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend # Enable history appending instead of overwriting.  #139609
shopt -s autocd  	# Auto cd when just directory name provided
shopt -s cdspell	# Minor errors in the spelling of a directory component in a cd command are corrected
shopt -s cmdhist 	# bash attempts to save all lines of a multiple-line command in the same history entry.

# ASCII ART
#ascii-art
