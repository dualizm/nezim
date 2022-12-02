#        . .  .             
# .-..-.-|-..-| .-.-..-. .-.
# ' '`-' '-'`-'-' ' '`-`-' '
# makefile
                          
.PHONY: all init build clean

fen         := fennel
fnl-dir     := fnl/
build-dir   := lua/

fnl-src := $(wildcard $(fnl-dir)*.fnl)
lua-src := $(patsubst $(fnl-dir)%.fnl, $(build-dir)%.lua, $(fnl-src))

all: init build

build: $(fnl-src)
	$(fen) -c $(fnl-src) > $(build-dir)main.lua

$(lua-src)%.lua: $(fnl-src)%.fnl $(fen)
	$(fen) -c $< > $@

init: init.fnl
	$(fen) -c $< > $@.lua

clean: 
	rm -rf $(build-dir)*
