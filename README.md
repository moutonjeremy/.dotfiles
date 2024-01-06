# .dotfiles

# Macos Settings

## Permanently Hide Dock

```bash
defaults write com.apple.dock autohide-delay -float 9999; killall Dock
```

## Fonts
  
```bash
brew tap homebrew/cask-fonts
brew install homebrew/cask-fonts/font-hack-nerd-font
```

## sketchybar

```bash
brew tap FelixKratz/formulae
brew install sketchybar
stow sketchybar
```

## yabai

### Installation

```bash
brew install koekeishiya/formulae/yabai
brew services start yabai
brew install koekeishiya/formulae/skhd
brew services start skhd
```

(Copied from [yabai GitHub](<https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)>) and [skhd GitHub](https://github.com/koekeishiya/skhd))

## zsh

```bash
brew install zsh
stow zsh
```