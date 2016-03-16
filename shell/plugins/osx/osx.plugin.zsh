
# quick look
alias ql='qlmanage -p 2>/dev/null'
alias top_mem='top -o vsize'
alias top_cpu='top -o cpu'

# Quit an OS X application from the command line
quit () {
    for app in $*; do
        osascript -e 'quit app "'$app'"'
    done
}

relaunch () {
    for app in $*; do
        osascript -e 'quit app "'$app'"';
        sleep 2;
        open -a $app
    done
}

