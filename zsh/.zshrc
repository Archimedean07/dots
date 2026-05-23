#!/usr/bin/sh
# ALIAS
if [[ -f $(which nvim) ]]; then
  alias vi="nvim"
else
  alias vi="vim"
fi

alias q="exit"
alias c="clear"

alias zshrc="nvim ~/dots/zsh/.zshrc"
alias zshrcs="source ~/dots/zsh/.zshrc"
alias vimrc="nvim ~/dots/nvim/init.lua"
alias vimrcs="source ~/dots/nvim/init.lua"
alias tmuxrc="nvim ~/dots/tmux/tmux.conf"
alias tmuxrcs="tmux source-file ~/dots/tmux/tmux.conf"

# OPTIONS
# # Tab completion moves to end of word.
setopt ALWAYS_TO_END
# # Zstyle.
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "$HOME/.zcompcache"
zstyle ':completion:*' list-colors $LS_COLORS
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))' zstyle ':completion:*' rehash true


HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"
HISTSIZE=100000
SAVEHIST=5000
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=30

unsetopt beep nomatch
## Options section
#setopt correct                                                  # Auto correct mistakes
#setopt nocaseglob                                               # Case insensitive globbing
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt pushdminus
setopt           auto_cd  auto_list           pushd_ignore_dups
setopt auto_pushd interactivecomments pushdsilent
setopt menu_complete            # Do Not Autoselect The First Completion Entry.
unsetopt flow_control           # Disable Start/Stop Characters In Shell Editor.
setopt complete_in_word         # Complete From Both Ends Of A Word.
setopt always_to_end            # Move Cursor To The End Of A Completed Word.
setopt path_dirs                # Perform Path Search Even On Command Names With Slashes.
setopt auto_menu                # Show Completion Menu On A Successive Tab Press.
setopt auto_param_slash         # If Completed Parameter Is A Directory, Add A Trailing Slash.
setopt no_complete_aliases
unsetopt share_history
setopt   no_share_history
setopt   bang_hist          extended_history  inc_append_history
setopt   hist_save_no_dups  hist_ignore_dups  hist_expire_dups_first
setopt   hist_find_no_dups  hist_ignore_space hist_ignore_all_dups
setopt   hist_reduce_blanks hist_verify       hist_beep
setopt promptsubst

[[ ! -r /home/ali/.opam/opam-init/init.zsh ]] || source /home/ali/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions
#  PROMPT COLORS
if [[ $EUID -ne 0 ]]; then
#     PROMPT="%B%1F[%f%3F%n%f%2F@%f%6F%m%f %4F%1~%f%5F\$(git_info)%f%1F]%f%7F$%f %b"
    PROMPT="%B%1F[%f%3F%n%f%2F@%f%6F%m%f %4F%1~%f%1F]%f%7F$%f %b"
else
    PROMPT="%B%3F[%n@%m %1~]# %f%b"
fi




# fnm
FNM_PATH="/home/ali/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --shell zsh)"
fi
