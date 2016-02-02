#!/bin/bash

bash_prompt_cmd() {
        local CY="\[\e[1;37m\]" # Each is 12 chars long
        local BL="\[\e[38;5;179m\]"
        local RE="\[\e[1;31m\]"
        local PROMPT="${CY}$"
        [ $UID -eq "0" ] && PROMPT="${RE}#"

        # Add the first part of the prompt: username,host, and time
        local PROMPT_PWD="\w"
        local PS1_T1="$BL.:[ $CY\u$BL@$CY\h $BL: $CY\D{%H}$WH:$CY\D{%M%P} $BL:$CY "
		#local ps_len=$(( ${#PS1_T1} - 12 * 6 + 6 + 4 )) #Len adjust for colors, time and var
        local PS1_T2=" $BL:$CY ]:.\n${PROMPT} \[\e[0m\]"
		#local startpos=""

        #PROMPT_PWD="${PWD/#$HOME/~}"
		#local overflow_prefix="..."
        #local pwdlen=${#PROMPT_PWD}
        #local maxpwdlen=$(( COLUMNS - ps_len ))
        ## Sometimes COLUMNS isn't initiliased, if it isn't, fall back on 80
        #[ $maxpwdlen -lt 0 ] && maxpwdlen=$(( 80 - ps_len )) 

        #if [ $pwdlen -gt $maxpwdlen ] ; then
                #startpos=$(( $pwdlen - maxpwdlen + ${#overflow_prefix} ))
                #PROMPT_PWD="${overflow_prefix}${PROMPT_PWD:$startpos:$maxpwdlen}"
        #fi      
        export PS1="${PS1_T1}${PROMPT_PWD}${PS1_T2}"
}
PROMPT_COMMAND=bash_prompt_cmd

