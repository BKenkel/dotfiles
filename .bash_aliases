
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias gsync="git submodule sync --recursive && git submodule update --init --recursive"
alias cal="ncal -bw"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

function sha(){
        echo "Summing File: $1"
        echo "md5sum:"
        md5sum $1 | awk '{ print $1 }'
        echo "sha256sum:"
        sha256sum $1 | awk '{ print $1 }'
        echo "sha1sum:"
        sha1sum $1 | awk '{ print $1 }'
}

# Use Bat for seeing file context with syntax highlighting for diffs
batdiff () {
        bat --diff $(git diff --name-only --diff-filter=d)
}

