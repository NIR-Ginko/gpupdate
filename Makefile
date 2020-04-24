.PHONY: all

# Build bytecode and native gpoa versions
all:
	dune build bin/gpoa.bc
	dune build bin/gpoa.exe
	dune build bin/gpupdate.bc
	dune build bin/gpupdate.exe

update:
	opam update
	opam upgrade

