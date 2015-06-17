# ssh aliases
alias outpi="ssh pi@perplexed.duckdns.org -p " # Note: put correct port in
alias sshpi="ssh pi@192.168.1.102"
alias yakko="ssh themind@yakko.cs.wmich.edu"
alias moshko="mosh themind@yakko.cs.wmich.edu"

# Application aliases

# Only for OSX
if [ -z (which lsb_release) ]
    alias subl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"
end

alias ll="ls -lh"
alias la="ll -A"
alias lll="ls -lAh | less"
alias pd="cd .."

function ctd
    cd (td -d $argv)
end


# Useful variables and PATH
set pi 192.168.1.102

# Depends on OSX vs. *nix
if [ -z (which lsb_release) ]
    set energia "/Applications/Energia.app/Contents/Resources/Java/hardware/tools/msp430"
    set custom_bin_prefix "/Users"
else
    set energia "/opt/energia/hardware/tools/msp430/msp430"
    set custom_bin_prefix "/Home"
end

set -gx PATH $PATH "$energia/bin" "$energia/mspdebug" "$custom_bin_prefix/James/Programming/bin"

