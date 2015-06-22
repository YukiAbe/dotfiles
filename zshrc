### Generic .zshrc file for zsh(1)

LOCAL=$HOME/local

## Environment variable configuration
#
export LC_ALL=en_US.UTF-8
# export LANG=ja_JP.UTF-8 # C
# export LC_CTYPE=C
# export LC_NUMERIC=C
# export LC_COLLATE=C
# export LC_MONETARY=C
# export LC_MESSAGES=C
# export LC_TIME=en_US.UTF-8 # C

[ -d $LOCAL/bin ]     && export PATH=$LOCAL/bin
[ -d $LOCAL/scripts ] && export PATH=$PATH:$LOCAL/scripts

export BIBINPUTS=".:$HOME/Library/texmf/bibtex/bib:"
export BSTINPUTS=".:$HOME/Library/texmf/bibtex/bst:"
export TEXINPUTS=".:$HOME/Library/texmf/ptex/platex/macros:"
export PATH=$PATH:/usr/texbin:/Applications/gnuplot.app/bin:$PATH:${LOCAL}/convmv
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=/usr/local/bin:${PATH}
export MANPATH=$MANPATH:/opt/local/share/man:/opt/local/man
# export LSCOLORS=exfxcxdxbxegedabagacad
# export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# export SHELL=zsh
export EDITOR=vim


# abe for mac 
export R_HOME=/Library/Frameworks/R.framework/Resources
export PATH="$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin"
# export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/Applications/Xcode.app/Contents/Developer/usr/lib"


## Default shell configuration
#
# set prompt
#
autoload colors
colors
local BLACK=$'%{\e[0;30m%}'
local RED=$'%{\e[1;31m%}'
local GREEN=$'%{\e[2;32m%}'
local GREEN_REVERSE=$'%{\e[7;32m%}'
local YELLOW=$'%{\e[1;33m%}'
local BLUE=$'%{\e[1;34m%}'
local BLUE_REVERSE=$'%{\e[7;34m%}'
local SKYBLUE=$'%{\e[1;36m%}'
local SKYBLUE_REVERSE=$'%{\e[7;36m%}'
local GRAY=$'%{\e[1;37m%}'    # GRAY=$'%{\e[1;38m%}'
local REVERSE=$'%{\e[7;37m%}' # REVERSE=$'%{\e[7;30m%}'
local DEFAULT=$'%{\e[1;m%}'

# auto change directory
#
setopt auto_cd

# auto push directory (cd -[tab])
#
setopt auto_pushd

# correct command typos
#
# setopt correct
# # setopt autocorrect

# compacked complete list display
#
setopt list_packed

# do not remove slash automatically
#
# setopt noautoremoveslash

# no beep sound when complete lists are displayed
#
setopt nolistbeep

setopt nobeep

# set autolist=ambigous
# set complete=enhance

setopt pushd_ignore_dups    # don't duplicate the directory when "pushd"
setopt extended_glob        # mkdir bak; mv *~bak bak
                            # mv -*.txt bak
                            # ls *.(sh|txt)
                            # ls <10-15>*; ls *<->*
                            # ls {1..3}.txt
                            # try 'echo {0..255}', 'echo {000...255}'
                            # for i in {00..15}
setopt ignore_eof
setopt longlistjobs

# disable \C-q and \C-s
#
# setopt noflowcontrol

## Keybind configuration
#
# emacs like keybind
#
bindkey -e

# Ctrl-W
#
WORDCHARS='*?[]~&;!#$%^(){}<>'
# WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'


# history backward/forward search
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end # history-beginning-search-backward
bindkey "^N" history-beginning-search-forward-end  # history-beginning-search-forward
bindkey "\\eP" history-beginning-search-backward-end
bindkey "\\eN" history-beginning-search-forward-end

## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_dups     # ignore duplicated command (history)
setopt share_history        # share command history data
setopt extended_history     # when (date) and what (command)

setopt hist_ignore_all_dups
setopt hist_reduce_blanks
# Do not add the command to the history if it begins with a space
setopt hist_ignore_space

## Completion configuration
#
fpath=(~/.zsh/functions/Completion ~/.zsh/functions/Misc ${fpath})
autoload -U compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

## zsh editor
#
autoload my_zed

## Alias configuration
#
# expand aliases before completion
#
setopt complete_aliases

# alias where="command -v"
# alias j="jobs -l"

case ${OSTYPE} in
  freebsd*)
    alias ls='ls -FG'
    alias la='ls -aG'
    alias  l='ls -lFGh'
    alias ll='ls -laGh'
    alias -g H='| head'
    alias -g T='| tail'
    alias -g S='| sed'
    alias rm='rm -i'
    alias cp='cp -i'
    alias mv='mv -i'
    ;;
  linux*|cygwin)
    alias ls="ls --color=auto -FG"
    alias la="ls --color=auto -aG"
    alias  l="ls --color=auto -lFGh"
    alias ll="ls --color=auto -laGh"
    alias -g H='| head'
    alias -g T='| tail'
    alias -g S='| sed'
    alias rm='rm -i'
    alias cp='cp -i'
    alias mv='mv -i'
    alias grep='grep --color=auto'
    ;;
  darwin*)
    if [ -d /opt/local ]; then
      alias ls="ls -FG"
      alias la="ls -aFG"
      alias  l="ls -lFG"
      alias ll="ls -laFG"
#      alias ls="gls --color=auto -FG"
#      alias la="gls --color=auto -aG"
#      alias  l="gls --color=auto -lFGh"
#      alias ll="gls --color=auto -laGh"
      alias -g H='| ghead'
      alias -g T='| gtail'
      alias -g S='| gsed'
      alias rm='rm -i'
      alias cp='cp -i'
      alias mv='mv -i'
#       alias rm='grm -i'
#       alias cp='gcp -i'
#       alias mv='gmv -i'
    else
      alias ls="ls -FG"
      alias la="ls -aG"
      alias  l="ls -lFGh"
      alias ll="ls -laGh"
      alias -g H='| head'
      alias -g T='| tail'
      alias -g S='| sed'
      alias rm='rm -i'
      alias cp='cp -i'
      alias mv='mv -i'
    fi
    ;;
esac

# if [ -x `where dircolors` ] && [ -e $HOME/.dircolors ]; then
#     eval `dircolors $HOME/.dircolors`
# fi

## Function
#
function cd() { builtin cd $@ && ls; }

## Terminal configuration
#
case ${TERM} in
  xterm)
#   export TERM=xterm-color
    ;;
  kterm)
    export TERM=kterm-color
    # set BackSpace control character
    stty erase
    ;;
  screen)
    chpwd () { echo -n "_`dirs`\\" }
    preexec() {
      # see [zsh-workers:13180]
      # http://www.zsh.org/mla/workers/2000/msg03993.html
      emulate -L zsh
      local -a cmd; cmd=(${(z)2})
      case $cmd[1] in
        fg)
          if (( $#cmd == 1 )); then
            cmd=(builtin jobs -l %+)
          else
            cmd=(builtin jobs -l $cmd[2])
          fi
          ;;
        %*)
          cmd=(builtin jobs -l $cmd[1])
          ;;
        cd)
          if (( $#cmd == 2)); then
            cmd[1]=$cmd[2]
          fi
          ;;
        *)
#         echo -n "k$cmd[1]:t\\"
          echo -n "k$HOST:$cmd[1]:t\\"
          return
          ;;
      esac

      local -A jt; jt=(${(kv)jobtexts})

      $cmd >>(read num rest
        cmd=(${(z)${(e):-\$jt$num}})
        echo -n "k$HOST:$cmd[1]:t\\") 2>/dev/null
    }
    chpwd
    export TERM=xterm
    ;;
esac

## My .zshrc configuration file
#
# [ -f ~/.my_zshrc ] && source ~/.my_zshrc
