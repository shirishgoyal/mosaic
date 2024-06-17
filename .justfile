default: help

ROOT_DIR := `pwd`
APP_NAME := "mosaic"

# list of commands
help: 
    @just --list

# create a new release
publish:
    mix git_ops.release

# install missing dependencies
deps:
    mix deps.get

# clean unused dependencies
deps-clean:
    mix deps.clean --unlock --unused

# check outdated packages
deps-check:
    mix hex.outdated    