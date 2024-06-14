default: help

ROOT_DIR := `pwd`
APP_NAME := "mosaic"

# list of commands
help: 
    @just --list

# create a new release
publish:
    mix git_ops.release