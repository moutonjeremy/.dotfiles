# .dotfiles

# Macos Settings

## Permanently Hide Dock

```bash
defaults write com.apple.dock autohide-delay -float 9999; killall Dock
```


## sketchybar

```bash
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
stow zsh
```