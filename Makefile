# =========================================================
#                       SMOKE TEST
# ---------------------------------------------------------
# @brief :    Smoke Test for GNU Makefile
# @author:    qinhj@lsec.cc.ac.cn
# @version:   v1.1 2020/06/09
# =========================================================

## include global makefile config
MAK_INC ?=
ifdef MAK_INC
include $(MAK_INC)
endif #!MAK_INC

## test env
EXP2_ENV ?= "export env2 in Makefile in cmd"
EXP3_ENV ?= "not export env3 in Makefile"
EXP4_ENV := "export env4 in Makefile by export"
export EXP4_ENV

## color
GREEN="\033[32m"
YELLOW="\033[33m"
NORMAL="\033[0m" # "\e[39m"
RED="\033[31m"

## subdir
subdir = sub1 sub2 sub3 test template

## ====================================================================================

## 1st target will be the default target
default: info

demo1 demo2:
	@echo "Hello, I'm $@. ${DEMO_ENV}"

## always be included even defined after demo*
-include demo.mak
## surprise! '&' can't in the string.
DEMO_ENV?="This is demo env: @^DCYWsdf"

_dir:
	@cd test && echo "Hello, I'm in test!" && ls -l
	@cd test; echo "Hello, I'm in test again!"; ls -l
	@echo "Hello, am I in test?" && ls -l

_clean:
	@echo "Hello, I'm _clean"
## it's ok to define a phony target without any recipe
clean: _echo
## it's ok to redefine a target's recipe
#clean:
#	@echo "Hello, I'm clean"
## old recipe wiil be overrided by new one
## dep order: from bottom to top(e.g. _clean -> _echo)
clean: _clean _echo
	@## note one can also ignore the make error by '-'
	@## e.g. -rm *~ *.d *.o *.s *.i
	@rm -f *~ *.d *.o *.s *.i echo
	@## '-' can be used either before or after other symbols
	@for dir in $(subdir); do make -C $$dir $@ || exit; done

_echo: echo
	@echo "Hello, I'm _echo"

## There is no file or rules for fake target ".phony",
## so it'll always be updated by make. The recipe of
## of target "echo" will always be exec, since one of
## its dependency(".phony") has been updated.
echo: .phony
	@echo "Hello, I'm echo!"
	@touch echo

info: #.phony
	@echo ${RED}"================================"${YELLOW}
	@echo "MAKE_DIR: main"
	@echo "PROJ_DIR: $(PROJ_DIR)"
	@echo "MAKE_INC: $(MAK_INC)"
	@echo "EXP1_ENV: $(EXP1_ENV)"
	@echo "EXP2_ENV: $(EXP2_ENV)"
	@echo "EXP3_ENV: $(EXP3_ENV)"
	@echo "EXP4_ENV: $(EXP4_ENV)"
	@echo ${RED}"================================"${NORMAL}
	@for dir in $(subdir); do make -C $$dir EXP2_ENV=$(EXP2_ENV) || exit; done


	@echo "It seems that I can still echo sth here ..."

	@echo "It seems that I can still do sth even in here ..."

.PHONY: .phony info clean
