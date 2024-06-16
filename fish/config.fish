if status is-interactive
    alias --save ranger='ranger --choosedir=$HOME/.rangerdir; set LASTDIR $(cat $HOME/.rangerdir); cd "$LASTDIR"'
end

set -x EDITOR nvim
