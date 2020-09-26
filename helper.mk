# =========================================================
#                   MAKEFILE ASSISTANT
# ---------------------------------------------------------
# @author:    qinhj@lsec.cc.ac.cn
# @version:   [v1.0.0]  2020/09/26
# =========================================================

## console color
GREEN="\033[32m"
YELLOW="\033[33m"
NORMAL="\033[0m" # "\e[39m"
RED="\033[31m"
export RED GREEN YELLOW NORMAL

## kbuild verbose
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
