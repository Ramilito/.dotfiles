# Dotfiles

## Showcase
|  _Custom theme and PROMPT_
:-------------------------:
![prompt](https://raw.github.com/Ramilito/.dotfiles/main/docs/images/prompt.png)

|  _Performance_
:-------------------------:
![perf](https://raw.github.com/Ramilito/.dotfiles/main/docs/images/dotfiles-perf.png)

## What
Oh my zsh optimized for speed and low input lag.
Use as a bare repo and split up into multiple files for easy management.

## How
Uses zsh-defer for faster startup time, custom kubectl prompt using kubesess for context/lookup.


## Installation

[Use as a bare repo](https://www.atlassian.com/git/tutorials/dotfiles)

```zsh
git clone --bare https://github.com/Ramilito/.dotfiles.git $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config checkout

```
## Dependencies

- zsh-defer: `git clone https://github.com/romkatv/zsh-defer.git ~/zsh-defer`

