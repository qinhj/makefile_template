# =========================================================
#                       UBOOT TEST
# ---------------------------------------------------------
# @brief :    Uboot Test with GNU Makefile
# @author:    qinhj@lsec.cc.ac.cn
# @version:   v1.0 2020/06/09
# =========================================================

## color
GREEN="\033[32m"
YELLOW="\033[33m"
NORMAL="\033[0m" # "\e[39m"
RED="\033[31m"

## test func: shell (one must assign the echo output to a var!)
#$(shell echo "hello world")    <-- X error
ECHO_TEST := $(shell echo "hello world")

## uboot build verbose
ifeq ("$(origin V)", "command line")
  KBUILD_VERBOSE = $(V)
endif
ifndef KBUILD_VERBOSE
  KBUILD_VERBOSE = 0
endif

ifeq ($(KBUILD_VERBOSE),1)
  quiet =
  Q =
else
  quiet=quiet_
  Q = @
endif

export quiet Q KBUILD_VERBOSE

## test func: origin
O := "inner"
ifdef O
## update BUILD_DIR
ifeq ("$(origin O)", "command line")
BUILD_DIR := $(O) ## redefined by cmd line
else
BUILD_DIR := $(O) ## as "inner"
endif ## origin O
endif

## ====================================================================================

default: info

echo:
	$(Q)echo "ECHO_TEST: $(ECHO_TEST)"

clean:
	$(Q)## note one can also ignore the make error by '-'
	$(Q)## e.g. -rm *~ *.d *.o *.s *.i
	$(Q)rm -f *~ *.d *.o *.s *.i
	$(Q)## '-' can be used either before or after other symbols
	$(Q)-for dir in $(subdir); do make -C $$dir $@ || exit; done

info:
	$(Q)echo ${RED}"================================"${YELLOW}
	$(Q)echo "MAKE_DIR: uboot"
	$(Q)echo "BUILD_DIR: $(BUILD_DIR); O: $(O)"
	$(Q)echo ${RED}"================================"${NORMAL}
	$(Q)for dir in $(subdir); do make -C $$dir || exit; done

.PHONY: info clean

