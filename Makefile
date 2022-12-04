#        . .  .             
# .-..-.-|-..-| .-.-..-. .-.
# ' '`-' '-'`-'-' ' '`-`-' '
# makefile
                          
.PHONY: all init build clean help install-packer packages settings lualine-confing

fen         := fennel
packs-dir   := packages-config
fnl-dir     := fnl
build-dir   := lua

fnl-src := $(wildcard $(fnl-dir)/*.fnl)
lua-src := $(patsubst $(fnl-dir)/%.fnl, $(build-dir)/%.lua, $(fnl-src))

all: init settings packages lualine-config

help:
	@printf "run \"make\" to compile all fnl files in lua.\n"\
	"run \"make install-packer\" to install the package manager.\n"\
	"run \"make clean\" to clear all compiled lua files.\n"

lualine-config: $(fnl-dir)/$(packs-dir)/lualine-config.fnl
	$(fen) -c $< > $(build-dir)/$@.lua

packages: $(fnl-dir)/packages.fnl
	$(fen) -c $< > $(build-dir)/$@.lua

settings: $(fnl-dir)/settings.fnl
	$(fen) -c $< > $(build-dir)/$@.lua

init: init.fnl
	$(fen) -c $< > $@.lua

install-packer: git
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 		~/.local/share/nvim/site/pack/packer/start/packer.nvim

clean: 
	rm -rf $(build-dir)/*
