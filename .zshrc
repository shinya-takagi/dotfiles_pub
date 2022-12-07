# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#                     zshrc
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Added by Zinit's installer
# if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
#     print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
#     command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
#     command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
#         print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
#         print -P "%F{160}▓▒░ The clone has failed.%f%b"
# fi
# 
# source "$HOME/.zinit/bin/zinit.zsh"
# autoload -Uz _zinit
# (( ${+_comps} )) && _comps[zinit]=_zinit

# Load sheldon (Sheldon is shell plugin manager.)
eval "$(sheldon source)"

# ------------UPPER ZINIT----------------------------

# Load *.zsh files in $HOME/.zsh directory.
# ZSHHOME="${HOME}/.zsh"
# if [ -d $ZSHHOME -a -r $ZSHHOME -a \
#      -x $ZSHHOME ]; then
#     for i in $ZSHHOME/*; do
# 	[[ ${i##*/} = *.zsh ]] &&
# 		[ \( -f $i -o -h $d \) -a -r $i ] && . $i
#     done
# fi

# ---------------------------------------------------

# -----------------------------
#         General
# -----------------------------
autoload -Uz colors ; colors    # Use colors
export EDITOR=vim               # Change an editor as vim.
#setopt IGNOREEOF               # Ignore logout with Ctrl + D 
setopt auto_pushd               # Automatic addition of directory as cd.
setopt pushd_ignore_dups        # Ignore same directory to add in stack.
setopt no_flow_control          # Disable flow control.
setopt extended_glob            # Use wildcard glob.
setopt auto_cd                  # Change directory without cd.
#setopt xtrace                  # Show command line when you run.
setopt auto_pushd               # Run pushd automatically.
setopt pushd_ignore_dups        # Ignore same pushd.
setopt no_beep                  # Disable beep.
setopt auto_param_keys          # complete () automatically.
setopt notify                   # Notify the condition change of bg process.
setopt print_eight_bit          # Can print 8 bit words.
setopt print_exit_value         # Print states when it ends excecpt status 0.
setopt mark_dirs                # Add / on expansion of file names.
setopt correct                  # Check spelling on command line.
setopt correct_all              # Check all spell on command line.
setopt no_clobber               # Ban overwrite with redirect.
setopt noautoremoveslash        # Don't remove a slash of the path.
export RSYNC_RSH=ssh            # use ssh on rsync
# ---------Other------------->
umask 022
ulimit -c 0

# -----------------------------
#   Key Binding
# -----------------------------
# vim like
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode   # Back to Normal with jj
# -----------------------------
#     Completion(WIP)
# -----------------------------
# ~~~ Start zsh-autocomplete ~~~
# zstyle ':completion:*'  list-colors '=*=90'
zstyle ':completion:*:parameters'  list-colors '=*=32'
zstyle ':completion:*:commands' list-colors '=*=1;31'
zstyle ':completion:*:builtins' list-colors '=*=1;38;5;142'
zstyle ':completion:*:aliases' list-colors '=*=2;38;5;128'
zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
setopt list_types
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
## ~~~ End zsh-autocomplete
# -----------------------------
#     History
# -----------------------------
# Basic
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000
# ヒストリーに重複を表示しない
setopt histignorealldups
# 他のターミナルとヒストリーを共有
setopt share_history
# すでにhistoryにあるコマンドは残さない
setopt hist_ignore_all_dups
# historyに日付を表示
alias h='fc -lt '%F %T' 1'
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
# 履歴をすぐに追加する
setopt inc_append_history
# ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_verify

# ---------zinit plugin--------------->
# zinit load olets/zsh-abbr   # Use abbreviations.
# [[ $(type abbr > /dev/null 2>&1) ]] && abbr import-aliases -S >/dev/null
# abbr import-aliases -S >/dev/null
# zinit load greymd/docker-zsh-completion # docker completion
# ------Plugin ------<

# --------Evaluation of github-cli completion------->
[[ $(type gh > /dev/null 2>&1) ]] && eval "$(gh completion -s zsh)"

# Dotfile manager "dot"
if [ ! -d $HOME/.dot ]; then
    git clone https://github.com/ssh0/dot "$HOME"/.dot

fi
source $HOME/.dot/dot.sh
fpath=($HOME/.dot $fpath)

#----------------------
function Terminal_Prompts(){
    #--------Powerline-------------->
    # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
    # Initialization code that may require console input (password prompts, [y/n]
    # confirmations, etc.) must go above this block; everything else may go below.
    if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
      source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    fi
    # Adopt powerlevel10k for powerline.
    if [ -e ~/powerlevel10k/powerlevel10k.zsh-theme ]; then
        source  ~/powerlevel10k/powerlevel10k.zsh-theme
    else
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
        source  ~/powerlevel10k/powerlevel10k.zsh-theme
    fi
    # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    #-----PROMPT--------------------<
}


# OS Machine Dependence
if [ "$(uname -s)" = "Linux" ]; then
    # Keyboard automatic to disable Caps Lock
    setxkbmap -option ctrl:nocaps
    # -----Display for Xserver------------->
    export DISPLAY=:0.0 
    # -----Xserver---------<
    Terminal_Prompts
    # Wine setting
    export WINEARCH="win64"
    if [ $WINEARCH = "win32" ]; then
      export WINEPREFIX="$HOME"/.win32
    else
      export WINEPREFIX="$HOME"/.win64
    fi
elif [ "$(uname -s)" = "Darwin" ]; then
    # Terminal Dependence
    if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
        Terminal_Prompts
    else
        eval "$(starship init zsh)"
    fi
fi
