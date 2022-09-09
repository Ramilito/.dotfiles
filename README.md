# Dotfiles

## Showcase

![demo](https://raw.github.com/Ramilito/.dotfiles/main/docs/images/demo.png)
![perf](https://raw.github.com/Ramilito/.dotfiles/main/docs/images/dotfiles-perf.png)

## What
Oh my zsh optimized for speed and low input lag.
Use as a bare repo and split up into multiple files for easy management.

## How
Uses zsh-defer for faster startup time, custom kubectl prompt using kubesess for context/lookup.


## Installation

```zsh
Use as a bare repo: https://www.atlassian.com/git/tutorials/dotfiles

Add this to .bashrc/.zshrc

```
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
```
