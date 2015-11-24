tmux-ghdump
===========

Dump your repository or starred repository with peco

## Description

This tpm plugin lists your repository or starred repository, then browse it with peco style.

## Requirements

* [tmux](https://tmux.github.io/)
* [peco](https://github.com/peco/peco)
* [ghdump](https://github.com/knakayama/ghdump)

## Install

* Install `ghdump`:

```bash
$ go get github.com/knakayama/ghdump
```

* Install tpm and add the following line to your `~/.tmux.conf`.

```bash
set-option -g @plugin 'knakayama/tmux-ghdump'
```

## Usage

Default key binding searching your repository is `Prefix + g`. If you want to change this key binding, set the following line to your `~/.tmux.conf`.

```bash
set-option -g @ghdump-yrepo-key 'x' # or your favorite key binding
```

Default key binding searching your starred repository is `Prefix + G`. If you want to change this key binding, set the following line to your `~/.tmux.conf`.

```bash
set-option -g @ghdump-srepo-key 'X' # or your favorite key binding
```

## License

MIT

## Author

[knakayama](https://github.com/knakayama)
