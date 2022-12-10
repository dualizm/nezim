#        . .  .             
# .-..-.-|-..-| .-.-..-. .-.
# ' '`-' '-'`-'-' ' '`-`-' '
# makefile
                          
.PHONY: all init build clean help\
				install install-packer\
				sync-plugins\

fen    	  := fennel
plug-dir  := plugins
fnl-dir   := fnl/config
build-dir := lua

fnl-plug-src 	:= $(wildcard $(fnl-dir)/$(plug-dir)/*.fnl)
fnl-src     	:= $(wildcard $(fnl-dir)/*.fnl) $(fnl-plug-src)

all: init build

init: fnl/init.fnl
	$(fen) --compile $< > $@.lua

build: $(fnl-src)
	$(foreach file, $(fnl-src),\
		$(fen) -c $(file) > $(build-dir)/$(notdir $(patsubst %.fnl, %.lua, $(file)));)

help:
	@printf "run \"make\" to compile all fnl files in lua.\n"\
	"run \"make install-packer\" to install the package manager.\n"\
	"run \"make clean\" to clear all compiled lua files.\n"

install: install-packer sync-plugins

install-packer: 
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 		~/.local/share/nvim/site/pack/packer/start/packer.nvim

sync-plugins:
	nvim -c ":PackerSync"

clean: 
	rm -rf $(build-dir)/*
