# =========================================================
#                       UBOOT TEST
# ---------------------------------------------------------
# @brief :    Uboot Test with GNU Makefile
# @author:    qinhj@lsec.cc.ac.cn
# @version:   v1.0 2020/06/09
# =========================================================

-include ../../helper.mk

## test func: shell (one must assign the echo output to a var!)
#$(shell echo "hello world")    <-- X error
ECHO_TEST := $(shell echo "hello world")

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
	$(Q)echo -e ${RED}"================================"${YELLOW}
	$(Q)echo "MAKE_DIR: uboot"
	$(Q)echo "BUILD_DIR: $(BUILD_DIR); O: $(O)"
	$(Q)echo -e ${RED}"================================"${NORMAL}
	$(Q)for dir in $(subdir); do make -C $$dir || exit; done

.PHONY: info clean

