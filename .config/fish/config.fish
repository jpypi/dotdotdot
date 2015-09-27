# ssh aliases
alias outpi="ssh pi@perplexed.duckdns.org -p " # Note: put correct port in
alias sshpi="ssh pi@192.168.1.102"
alias yakko="ssh themind@yakko.cs.wmich.edu"
alias moshko="mosh themind@yakko.cs.wmich.edu"
alias st="git status"

# Application aliases

# Only for OSX
set platform (uname)
set is_osx "YEP"
if [ $platform = "Linux" ]
    set is_osx ""
end

# Application aliases

if [ -n $is_osx ]
    alias ij="/Applications/IntelliJ IDEA 14.app/Contents/MacOS/idea"
end

alias ll="ls -lh"
alias la="ll -A"
alias lll="ls -lAh | less"
alias pd="cd .."

function cdt
    cd (td -d $argv)
end


# Local fileserver
function putpi -d "Upload a file to rpi when local."
    set file $argv[1]
    scp $file pi@$pi:fileserver/$file
end

function pullpi -d "Download a file from rpi when local."
    set file $argv[1]
    scp pi@$pi:fileserver/$file $file
end

set pi 192.168.1.102

complete -c pullpi -x -a "(ssh pi@$pi ls ~pi/fileserver)"

# Useful variables and PATH

# Depends on OSX vs. *nix
if [ -n $is_osx ]
    set energia "/Applications/Energia.app/Contents/Resources/Java/hardware/tools/msp430"
    set custom_bin_prefix "/Users"
else
    set energia "/opt/energia/hardware/tools/msp430/msp430"
    set custom_bin_prefix "/Home"
end

set -gx PATH $PATH "$energia/bin" "$energia/mspdebug" "$custom_bin_prefix/James/Programming/bin"

#fish_vi_mode
