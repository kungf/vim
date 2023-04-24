
alias egrep='egrep -G'
alias fgrep='fgrep -G'
alias grep='grep -G'
alias l.='ls -d .* -G'
alias ll='ls -alh -G'
alias ls='ls -G'
alias vi='vim'

export PS1='[%n@local %1~]$'

export PATH="/opt/homebrew/bin:/Users/yangwang/.cargo/bin:$PATH"

export FZF_DEFAULT_COMMAND='rg --hidden --ignore .git -l -g ""'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"

alias ts1='ssh learner@10.70.49.122'
alias ts2='ssh learner@10.70.49.50'
alias ts3='ssh learner@10.70.48.243'
alias ts4='ssh learner@10.70.48.57'

alias tm='tmux'

autoload -Uz compinit && compinit
