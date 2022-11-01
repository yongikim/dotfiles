set -x LANG ja_JP.UTF-8
alias reload='source ~/.config/fish/config.fish'
alias gst='git status'
alias pull='git pull'
alias push='git push'
alias tmux='tmux -f ~/.tmux.conf'

if type -q bat
  alias cat='bat'
end

if type -q exa
  alias ls='exa --icons'
end

if type -q nvim
  alias vi=nvim
end

if type -q rbenv
  status --is-interactive; and source (rbenv init -|psub)
end

# set -gx OMF_PATH $HOME/.local/share/omf

function fish_greeting
end

starship init fish | source
# source $OMF_PATH/init.fish
# source /Users/yongikim/.cargo/env
