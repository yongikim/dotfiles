set -x LANG ja_JP.UTF-8
alias reload='source ~/.config/fish/config.fish'
alias gst='git status'
alias dsales='cd ~/projects/sales;docker-compose start sales redis;docker attach sales'
alias bsales='cd ~/projects/sales;yarn run start:sales:dev'
alias pull='git pull'
alias push='git push'
alias cat='bat'
alias tmux='tmux -f ~/.tmux.conf'
alias ls='exa --icons'

status --is-interactive; and source (rbenv init -|psub)

# set -gx OMF_PATH $HOME/.local/share/omf
# set -gx FZF_DEFAULT_COMMAND 'ag -G ""'
set fish_theme agnoster

# source $OMF_PATH/init.fish

function fish_greeting
end

# source /Users/yongikim/.cargo/env
