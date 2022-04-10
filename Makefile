.PHONY: gitconfig-include-local
MAKEFLAGS += --no-builtin-rules
MAKEFLAGS += --no-builtin-variables
SHELL := /bin/bash
DIR := ${CURDIR}
nvim := nvim-from-system

gitconfig-include-local:
	git config --local include.path "$$(git rev-parse --show-toplevel)/.gitconfig"
	
submodule-update:
	git su

start: gitconfig-include-local submodule-update

nonexisting-buffer:
	$(nvim) -S test/01-nonexisting-buffer/run.lua

check-requirements:
	$(DIR)/.config/bin/check-requirements
