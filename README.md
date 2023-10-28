

# dotfiles

A list of my personal dotfiles! Mangaed with [toml-bombadil](https://github.com/oknozor/toml-bombadil).

Intiial prereqs: fish, helix, cargo, git. See `fish-config.fish` for full #operational use. 

## Install

```sh
# 3.1.0 is broken, so, living life on the edge
cargo install --git https://github.com/oknozor/toml-bombadil 
git clone https://github.com/peterkos/dotfiles ~/.dotfiles
bombadil install ~/.dotfiles
```

## Usage

```sh
bombadil link # Refresh files
```