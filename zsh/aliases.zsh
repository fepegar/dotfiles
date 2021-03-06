alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Pretty print the path (https://github.com/jeffcole/dotfiles/blob/master/aliases)
alias path='echo $PATH | tr -s ":" "\n"'

alias pl='print -l'

# Improve less
alias less='less -MN'

# Directories size
alias diru='du -sh * | gsort -hr'

# Recent history
rhist() {
  fc -l -"$1"
}

# mkdir and cd inside
mc() {
  mkdir "$1"
  cd "$1"
}

# For the dotfiles repo
alias gtree='git ls-tree -r master --name-only'

# (De)activate conda envs
alias act='conda activate'
alias dact='conda deactivate'

# Open man pages as PDF (https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)
function manpdf() {
 man -t "${1}" | open -f -a /Applications/Preview.app/
}

# Python HTTP server
alias server='python3 -m http.server'

# Googler
alias g='googler -n 3 -c COM -l en'

# 3D Slicer
alias slicer='/Applications/Slicer.app/Contents/MacOS/Slicer'

# crontab (http://drawohara.com/post/6344279/crontab-temp-file-must-be-edited-in-place)
alias crontab="VIM_CRONTAB=true crontab"

# Get public IP
alias ip="curl ifconfig.me"

# Open
alias op="open"

# Disable media keys and start in a reasonable window
alias mpv="mpv --input-media-keys=no --autofit=100% --save-position-on-quit"

# Quick Look
ql() {
    qlmanage -p "$1" >& /dev/null &
}

# Free space
alias free="conda clean --all -y && brew cleanup"

alias count="cd ~/git/mres-project-report/ && texcount -1 -sum -inc Thesis.tex && 1"

alias comic="ssh comic100"
alias storm="ssh fperezga@storm.cs.ucl.ac.uk"


alias clc="clear"

### LESS ###
# Enable syntax-highlighting in less.
# brew install source-highlight
# First, add these two lines to ~/.bashrc
export LESSOPEN="| src-hilite-lesspipe.sh %s"
export LESS=" -R "
alias less='less -m -N -g -i -J --underline-special --SILENT'
alias more='less'

alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'

# Better man pages
alias man="tldr"

