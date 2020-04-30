.PHONY: all

# Build bytecode and native gpoa versions
all:
	dune build bin/gpoa.bc
	dune build bin/gpoa.exe
	dune build bin/gpupdate.bc
	dune build bin/gpupdate.exe
	dune build gpstorage/gpstorage.bc

codeformat:
	dune build --auto-promote @fmt

update:
	opam update
	opam upgrade
	opam install ocamlfind
	opam install camlp4

