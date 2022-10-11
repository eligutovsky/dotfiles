export LANG=en_US.UTF-8

# Install plugins
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

plugins=( 
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
DEFAULT_USER="eligu"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Fonts
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Ruby
export PATH="$PATH:$HOME/.rvm/bin"

# Node
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Android 
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
alias run-android='emulator -avd Pixel_5_API_30 -qemu -no-audio'




alias zshrc="code ~/.zshrc"
alias reload!=". ~/.zshrc"



# wix related
alias npm-public='npm config set registry https://registry.npmjs.org'
alias npm-private='npm config set registry http://npm.dev.wixpress.com/'
alias npmclean='rm -rf node_modules && rm -rf package-lock.json && npm install --legacy-peer-deps'
alias rc='rm -rf $TMPDIR/metro-* && rm -rf $TMPDIR/haste-* && watchman watch-del-all'
export PATH=$PATH:./node_modules/.bin/
bah () {
	rm -f package-lock.json
	rm -rf node_modules
	rm -rf $TMPDIR/metro* && rm -rf $TMPDIR/haste-* && rm -rf ~/.rncache && watchman watch-del-all
	node --max_old_space_size=8000 $(which npm) install --legacy-peer-deps --loglevel http 
	echo -en "\007"
}

# git 

perciseCommit() {
    git commit -S -m "${1:-update}"
}

lazyCommit() {
    git add .
    git commit -S -m "${1:-update}"
}

superCommit(){
    git add .
    git commit -S -m "${1:-update}"
    git push
}

# ELI:git

alias gs='git status'
alias gsb='git status -sb'
alias gsts='git stash save'
alias gsta='git stash apply'
alias gstp='git stash pop'
alias gstl='git stash list'
alias gstc='git stash clear'
alias gsm='git switch master'
alias gmm='git merge master'
alias gmc='git merge --continue'
alias gfp='git fetch && git pull'
alias gush="git push"
alias gull="git pull"
alias st='stree .'

# Xcode via @orta
openx(){ 
  if test -n "$(find . -maxdepth 1 -name '*.xcworkspace' -print -quit)"
  then
    echo "Opening workspace"
    open *.xcworkspace
    return
  else
    if test -n "$(find . -maxdepth 1 -name '*.xcodeproj' -print -quit)"
    then
      echo "Opening project"
      open *.xcodeproj
      return  
    else
      echo "Nothing found"
    fi
  fi
}

# python env
eval "$(pyenv init -)"

# GPG
export GPG_TTY=$(tty)
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# 1Password
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
