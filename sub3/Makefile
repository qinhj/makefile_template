# =========================================================
#                MAKEFILE TEST: config.mak
# ---------------------------------------------------------
# @brief :    Test including submodule configuration.
# @author:    qinhj@lsec.cc.ac.cn
# @version:   v0.0.1 2020/03/30
# =========================================================

## color
GREEN="\033[32m"
YELLOW="\033[33m"
NORMAL="\033[0m" # "\e[39m"
RED="\033[31m"

## modify MAK_INC, failed
MAK_INC  := "modify MAK_INC in sub3 Makefile"

## modify EXP1_ENV ok, export failed
export EXP1_ENV="modify EXP1_ENV in sub3 Makefile"

## include user config(ignore error if not exist)
-include config.mak
## Actually, the following lines defined a var named as "SHIKI-y" or "SHIKI-yes", etc.
SHIKI-$(CONFIG_FEAT1)   += feature1
SHIKI-$(CONFIG_FEAT2)   += feature2
SHIKI-$(CONFIG_FEAT3)   += feature3
SHIKI-$(CONFIG_FEAT4)   += feature4
SHIKI-$(CONFIG_FEAT5)   += feature5
SHIKI-$(CONFIG_FEAT6)   += feature6
SHIKI-$(CONFIG_FEAT7)   += feature7
SHIKI-$(CONFIG_FEAT8)   += feature8

SHIKI := nothing

# ========================================================================================

default: info

clean:
	@## note one can also ignore the make error by '-'
	@## e.g. -rm *~ *.d *.o *.s *.i
	@rm -f *~ *.d *.o *.s *.i
	@## '-' can be used either before or after other symbols
	@for dir in $(subdir); do make -C $$dir $@ || exit; done

info:
	@echo ${RED}"================================"${YELLOW}
	@echo "MAKE_DIR: sub3"
	@echo "PROJ_DIR: $(PROJ_DIR)"
	@echo "MAKE_INC: $(MAK_INC)"
	@echo "EXP1_ENV: $(EXP1_ENV)"
	@echo "EXP2_ENV: $(EXP2_ENV)"
	@echo "EXP3_ENV: $(EXP3_ENV)"
	@echo "EXP4_ENV: $(EXP4_ENV)"
	@echo "--------------------------------"
	@echo "SHIKI:    $(SHIKI)"
	@echo "SHIKI-y:  $(SHIKI-y)"
	@echo "SHIKI-n:  $(SHIKI-n)"
	@echo "SHIKI-Y:  $(SHIKI-Y)"
	@echo "SHIKI-N:  $(SHIKI-N)"
	@echo "SHIKI-yes:$(SHIKI-yes)"
	@echo "SHIKI-no: $(SHIKI-no)"
	@echo ${RED}"================================"${NORMAL}
	@for dir in $(subdir); do make -C $$dir || exit; done

.PHONY: info clean

