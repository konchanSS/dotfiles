# Path to Oh My Fish install.
 set -q XDG_DATA_HOME
#   and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
#     or set -gx OMF_PATH "$HOME/.local/share/omf"
#
#     # Load Oh My Fish configuration.
#     source $OMF_PATH/init.fish
set fish_theme agnoster
alias g='git'
alias gs='git status'
alias gaa='git add -A'
alias ga='git add'
alias gb='git branch'
alias gco='git checkout'
alias gchb='git checkout -b'
alias gps='git push origin'
alias gf='git fetch'
alias gpl='git pull origin'
alias gst='git stash'
alias gl='git log'
alias be='bundle exec'

set -x GOPATH $HOME
set PYENV_ROOT $HOME/.pyenv
. (pyenv init - | psub)
set PATH $PATH $GOPATH/bin
set PATH $PATH $HOME/google-cloud-sdk/bin
set fish_plugins theme peco
eval (python -m virtualfish)
function fish_user_key_bindings
  bind \c]  peco_change_directory
  bind \cr peco_select_history
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kontanikazumasa/Downloads/google-cloud-sdk 2/path.fish.inc' ]; if type source > /dev/null; source '/Users/kontanikazumasa/Downloads/google-cloud-sdk 2/path.fish.inc'; else; . '/Users/kontanikazumasa/Downloads/google-cloud-sdk 2/path.fish.inc'; end; end
