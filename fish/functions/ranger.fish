function ranger --description 'alias ranger=ranger --choosedir=$HOME/.rangerdir; set LASTDIR $(cat $HOME/.rangerdir); cd "$LASTDIR"'
 command ranger --choosedir=$HOME/.rangerdir; set LASTDIR $(cat $HOME/.rangerdir); cd "$LASTDIR" $argv
        
end

funcsave
