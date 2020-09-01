# =========================================================
#                   SMOKE TEST: SUB2/aa
# ---------------------------------------------------------
# @brief :    Smoke Test for GNU Makefile
# @author:    qinhj@lsec.cc.ac.cn
# @version:   v1.1 2020/06/09
# =========================================================

## color
GREEN="\033[32m"
YELLOW="\033[33m"
NORMAL="\033[0m" # "\e[39m"
RED="\033[31m"

## define EXP3_ENV
EXP3_ENV := "define env3 in bb Makefile"

## ====================================================================================

default: info

clean:
	@## note one can also ignore the make error by '-'
	@## e.g. -rm *~ *.d *.o *.s *.i
	@rm -f *~ *.d *.o *.s *.i
	@## '-' can be used either before or after other symbols
	@for dir in $(subdir); do make -C $$dir $@ || exit; done

info:
	@echo ${RED}"================================"${YELLOW}
	@echo "MAKE_DIR: bb"
	@echo "PROJ_DIR: $(PROJ_DIR)"
	@echo "MAKE_INC: $(MAK_INC)"
	@echo "EXP1_ENV: $(EXP1_ENV)"
	@echo "EXP2_ENV: $(EXP2_ENV)"
	@echo "EXP3_ENV: $(EXP3_ENV)"
	@echo "EXP4_ENV: $(EXP4_ENV)"
	@echo ${RED}"================================"${NORMAL}

.PHONY: info clean

