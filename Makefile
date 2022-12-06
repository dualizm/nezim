#        . .  .             
# .-..-.-|-..-| .-.-..-. .-.
# ' '`-' '-'`-'-' ' '`-`-' '
# makefile
                          
.PHONY: all init build clean\
				help install-packer

fen    	  := fennel
plug-dir  := plugins
fnl-dir   := fnl/config
build-dir := lua

fnl-plug-src 	:= $(wildcard $(fnl-dir)/$(plug-dir)/*.fnl)
fnl-src     	:= $(wildcard $(fnl-dir)/*.fnl) $(fnl-plug-src)

all: init build

help:
	@printf "run \"make\" to compile all fnl files in lua.\n"\
	"run \"make install-packer\" to install the package manager.\n"\
	"run \"make clean\" to clear all compiled lua files.\n"

build: $(fnl-src)
	$(foreach file, $(fnl-src),\
		$(fen) -c $(file) > $(build-dir)/$(notdir $(patsubst %.fnl, %.lua, $(file)));)

init: fnl/init.fnl
	$(fen) --compile $< > $@.lua

install-packer: 
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 		~/.local/share/nvim/site/pack/packer/start/packer.nvim

clean: 
	rm -rf $(build-dir)/*
