.PHONY: all

# Build bytecode and native gpoa versions
all:
	dune build src/gpoa/gpoa.bc
	dune build src/gpupdate/gpupdate.bc
	dune build src/gpstorage/gpstorage.bc

codeformat:
	dune build --auto-promote @fmt

update:
	opam update
	opam upgrade
	opam install ocamlfind
	opam install camlp4

