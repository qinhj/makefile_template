# =========================================================
#                       PACKAGE NAME
# ---------------------------------------------------------
# @brief :    Template for GNU Makefile
# @author:    qinhj@lsec.cc.ac.cn
# @version:   v1.0 2020/02/14
# =========================================================

-include config.rc

# compiler
CC  := $(CROSS_TOOL)gcc
CXX := $(CROSS_TOOL)g++
AR  := $(CROSS_TOOL)ar
LD  := $(CROSS_TOOL)ld
STRIP := $(CROSS_TOOL)strip

# user config:
CFLAG   += --sysroot=$(SYSROOT) -fmessage-length=0
CPPFLAG += --sysroot=$(SYSROOT) -fmessage-length=0
CFLAG   += #-O0 -g3 -W -D _DEBUG #-D _GNU_SOURCE -fvisibility=hidden
CPPFLAG += #-O0 -g3 -W -D _DEBUG #-D _GNU_SOURCE -fvisibility=hidden

# include settings
inc     := #-I./inc
extinc  += #-I./extinc
INCFLAG := $(inc) $(extinc)

# library settings
lib     := #-L./lib
extlib  +=
LIBPATH := $(lib) $(extlib)
# -------------------------------------------------------------
# Note: To link libdl.so, one need add -D _GNU_SOURCE to CFLAG.
# To link static libraries, use “-Wl,-dn”, while use "-Wl,-dy"
# to link shared libraries. Use "-static" for all.
# -------------------------------------------------------------
LIBLINK := #-ldl

# ========================================================================================

# compile flag
LIBFLAG := $(CFLAG) -shared -fPIC
LDFLAG  := $(LIBPATH) -rdynamic -Wl,--as-needed $(LIBLINK)

# runtime rpath dir
RPATH_DIR ?= .#:$(SYSROOT)/usr/lib

# targets: lib/bin/sample
LIBRARY := libfunc.so
BINARY  := test demo
TARGETS := $(LIBRARY) $(BINARY)

# source code files
SRC_DIRS := . #./src
SRC_FILE := $(foreach dir, $(SRC_DIRS), $(wildcard $(dir)/*.c))
SRC_OBJS := $(patsubst %.c, %.o, $(SRC_FILE))

# ========================================================================================

default: all

# ------------------
lib: $(LIBRARY)
# ------------------
libfunc.so: ./func.o
	$(CC) -o $@ $^ $(LIBFLAG) $(LDFLAG)

# ------------------
bin: lib $(BINARY)
# ------------------
test: ./test.o
	$(CC) -o $@ $^ $(CFLAG) $(LDFLAG) -L. -lfunc -Wl,-rpath,$(RPATH_DIR)
demo: $(SRC_OBJS)
	$(CC) -o $@ $^ $(CFLAG) $(LDFLAG) #-Wl,-rpath,$(RPATH_DIR)

all: info
	make bin
	make _clean

_clean:
	@for subdir in $(SRC_DIRS); do \
		(cd $$subdir && rm -rf *.o *~ *.d) \
	done;

clean: _clean
	rm -f $(TARGETS)

info:
	@echo "============================================================================="
	@echo "ROOT_DIR: $(ROOT_DIR)"
	@echo "COMPILER: $(CC)/$(CXX)"
	@echo "SYSROOT:  $(SYSROOT)"
	@echo "STAGING:  $(STAGING)"
	@echo "DESTDIR:  $(DESTDIR)"
	@echo "============================================================================="

install: info
	@echo "============================================================================="
	@echo "Not support install yet!"
	@echo "============================================================================="
	$(STRIP) $(TARGETS)
	#@cp -v $(LIBRARY) $(DESTDIR)/lib/
	#@cp -v $(BINARY) $(DESTDIR)/bin/
	#@cp -v *.h $(STAGING)/usr/include/
	#@cp -v $(LIBRARY) $(STAGING)/usr/lib/

.NOTPARALLEL: clean demo
.PHONY: all clean info install

# ========================================================================================

%.o: %.c
	$(CC) $(INCFLAG) -fPIC -O2 $(CFLAG) -o $@ -c $<

%.o: %.cpp
	$(CXX) $(INCFLAG) -fPIC -O2 $(CPPFLAG) -o $@ -c $<
