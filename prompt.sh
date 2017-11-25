#!/bin/bash
# Bash prompt theme (PS1)

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

local EXIT=$1; PS1="";
local USER_FG=231; local USER_BG=$([ $USER = root ] && echo 124 || echo 31);
local BRANCH_FG=251; local BRANCH_BG=236;
local DIR_FG=251; local DIR_BG=240;
local DIR_SEP=245; local CUR_DIR_FG=253;
local ERR_FG=231; local ERR_BG=52;
local FG=0; local BG=0;
setcolors () { FG=$1;BG=$2;PS1+=$(echo -e "\[\E[$([ $3 -eq 1 ] && echo 1 || echo 0)m\]\[\E[38;5;$1m\]\[\E[48;5;$2m\]\c");}
chevron() { setcolors $BG $1 0;PS1+=$(echo -e "");}

setcolors $USER_FG $USER_BG 1;
PS1+=" $USER "
local BRANCH=$(parse_git_branch);
if [ ! -z $BRANCH ]; then
	chevron $BRANCH_BG;
	setcolors $BRANCH_FG $BRANCH_BG 0;
	PS1+=" $BRANCH ";
fi

IFS='/' read -r -a DIRS <<< "$(dirs)";
[ -z ${DIRS[0]} ] && DIRS[0]="/";
local CDIR=${DIRS[-1]};
unset 'DIRS[${#DIRS[@]}-1]';
chevron $DIR_BG;
for DIR in "${DIRS[@]}"; do
	setcolors $DIR_FG $DIR_BG 0;
	PS1+=" $(echo $DIR) ";
	setcolors $DIR_SEP $DIR_BG 0;
	PS1+="";
done
setcolors $CUR_DIR_FG $DIR_BG 1;
PS1+=" $CDIR "

if [ $EXIT -ne 0 ]; then
	chevron $ERR_BG;
	setcolors $ERR_FG $ERR_BG 0;
	PS1+=" $EXIT "
fi

chevron 0;
PS1+=$(echo -e "\[\E[0m\] ");
unset parse_git_branch setcolors chevron;

