source /usr/share/cachyos-fish-config/cachyos-config.fish
functions -e history
status get-file functions/history.fish | source

# XDG base dirs (these are already the default in most cases, but explicit doesn't hurt)
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state
# npm
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -gx NPM_CONFIG_CACHE $XDG_CACHE_HOME/npm
# Python
set -gx PYTHONPYCACHEPREFIX $XDG_CACHE_HOME/python
set -gx PYTHONUSERBASE $XDG_DATA_HOME/python
# Docker
set -gx DOCKER_CONFIG $XDG_CONFIG_HOME/docker
# AWS CLI
set -gx AWS_SHARED_CREDENTIALS_FILE $XDG_CONFIG_HOME/aws/credentials
set -gx AWS_CONFIG_FILE $XDG_CONFIG_HOME/aws/config
# less
set -gx LESSHISTFILE $XDG_STATE_HOME/less/history
# Node.js REPL
set -gx NODE_REPL_HISTORY $XDG_STATE_HOME/node_repl_history
# Rust/Cargo
set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup
# Go
set -gx GOPATH $XDG_DATA_HOME/go
# GnuPG
set -gx GNUPGHOME $XDG_DATA_HOME/gnupg

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
    fastfetch
end
