.PHONY: all clean

comp        := fennel
config-name := config
config-lang := fnl
build-dir   := lua

all: $(config-name).$(config-lang)
	$(comp) -c $< > lua/$(config-name).lua

clean: rm
	rm -rf $(build-dir)/*
