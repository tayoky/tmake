# makefile include with default values
MAKEFLAGS += --no-builtin-rules
CC ?= cc
LD ?= ld
AS ?= as
BUILDDIR ?= $(CURDIR)/build
