#        . .  .             
# .-..-.-|-..-| .-.-..-. .-.
# ' '`-' '-'`-'-' ' '`-`-' '
# makefile
                          
.PHONY: all init build clean\
	help install-packer

fen    	  := fennel
cfg-dir   := cfg
fnl-dir   := fnl
build-dir := lua

fnl-cfg-src := $(wildcard $(fnl-dir)/$(cfg-dir)/*.fnl)
fnl-src     := $(wildcard $(fnl-dir)/*.fnl) $(fnl-cfg-src)

all: init build

help:
	@printf "run \"make\" to compile all fnl files in lua.\n"\
	"run \"make install-packer\" to install the package manager.\n"\
	"run \"make clean\" to clear all compiled lua files.\n"

build: $(fnl-src)
	$(foreach file, $(fnl-src),\
		$(fen) -c $(file) > $(build-dir)/$(notdir $(patsubst %.fnl, %.lua, $(file)));)

init: init.fnl
	$(fen) --compile $< > $@.lua

install-packer: 
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 		~/.local/share/nvim/site/pack/packer/start/packer.nvim

clean: 
	rm -rf $(build-dir)/*
