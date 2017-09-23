# [Homebrew](https://brew.sh/index_ru.html)

Instalation:
```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 
brew bundle
```

Search new app: 
```sh
brew cask search app name
```

# [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

Instalation:
```sh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp .zshrc ~/.zshrc
```
[Customization](https://gist.github.com/kevin-smets/8568070)

# Sublime
[Keyboard Shortcuts - OSX](http://docs.sublimetext.info/en/latest/reference/keyboard_shortcuts_osx.html)

Add the `subl` command:
```sh
sudo mkdir -p "/usr/local/bin/" && ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
```