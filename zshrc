# modloads
zmodload -i zsh/complist
zmodload -i zsh/terminfo

# shell options
setopt auto_param_slash
setopt autocd
setopt complete_aliases
setopt correct
setopt correct
setopt hist_ignore_dups
setopt sharehistory
setopt nobeep
setopt noflowcontrol

# history options
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000

# aliases for colour support
alias cp='cp --interactive'
alias egrep='egrep --color=auto'
alias grep='egrep --color=auto'
alias ls='ls --color=auto'
alias mv='mv -i'

# key overrides
[[ -n "${terminfo[kLFT5]}" ]] && bindkey -- "${terminfo[kLFT5]}" backward-word
[[ -n "${terminfo[kRIT5]}" ]] && bindkey -- "${terminfo[kRIT5]}" forward-word
bindkey -- '^H' backward-kill-word
bindkey -- '5~' kill-word

# menu key overrides
bindkey -M menuselect '^C' send-break
bindkey -M menuselect '\e' send-break
bindkey -M menuselect 'q' send-break
bindkey -M menuselect "$terminfo[kpp]" backward-word
bindkey -M menuselect "$terminfo[knp]" forward-word

# custom prompts
NL=$'\n'

if [[ $UID -eq 0 ]]; then
        PROMPT="%F{red}%n%f%F{green}@%f%F{red}%m%f%F{cyan} [ %~ ]%f ${NL}%F{red}#%f "
else
        PROMPT="%F{green}%n%f%F{red}@%f%F{green}%m%f%F{cyan} [ %~ ]%f ${NL}%F{green}>%f "
fi

# plugins
autoload -Uz compinit && compinit
autoload -Uz colors && colors

# zsh completion settings
zstyle ':completion:*' rehash true
zstyle ':completion:*' insert-tab false
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt "--- MORE (%p) ---"
zstyle ':completion:*' list-prompt "--- MORE (%p) ---"
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
