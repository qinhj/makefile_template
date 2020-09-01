## Sth About Makefile
```
* To pass vars to makefile in subdir, one can add vars after "make", as export in makefile:
$ make MAK_INC=$(pwd)/makefile.inc

* What's more,
(1) the vars followed by "make" can't be changed;
e.g.
# modify VAR won't work in makefile
$ make VAR="hard"
(2) the vars exported in makefile or include files can be updated, but only work in runtime makefile,
even re-export.
e.g.
$ cat makefile
include makefile.inc
...
$ cat makefile.inc
export env1="defined in makefile.inc"
...
$ cat sub1/makfile
export env1="modify env1 in sub makefile"
@echo $(env1)
...
"modify env1 in sub makefile"
$ cat sub2/makefile
@echo $(env1)
...
"defined in makefile.inc"

* All unexport vars won't pass to the subdir makefile.

* I'd suggest that one'd better export MAK_INC && ROOT_DIR when run "make".
```

## Tips
```
* Makefile 每次执行完后都会回到源目录
* One can use soft link in src, however one need to create softlinks for all included header files.
* One can use '-' to ignore all !0 return state and continue running.
* '+' Maybe for silent warning about make -jN.
* One can use '@' to disable runtime command echo.
* One can override variables defined in makefile by command line!
e.g. make VERSION=03.04
* Makefile use "/bin/sh" by default! One can change it via setting SHELL=/bin/bash in cmd line.
* One must assign the shell command output to a var in makefile!
e.g. ECHO_TEST := $(shell echo "hello world")
```

## Appendix
```
* sinclude: same as -include, but much more compatible with different version of makefile.

* origin: // e.g. ifeq ("$(origin O)", "command line")
1) 返回值为"undefine"时，这个变量没有被定义过；
2) 返回值为“command line”时，这个变量是被命令行定义的；
3) 返回值为“environment”时，这个变量是定义为环境变量；
4) 返回值为“file”时，这个变量是定义在Makefile中；
5) 返回值为“default”时，变量是默认定义的；
6) 返回值为“override”时，被override指示符重新定义；
7) 返回值为“automatic”时，是一个命令运行中自动化变量。

* .PHONY
1) make always wanna to create a target file, that's why we need a .PHONE(always run its recipe);
2) if target isn't a file or can't be created by make, then the recipe of target will exec;
3) default isn't an inner PHONY target for make, the 1st target in makefile will be the default target;
4) if one wants to always run some targets' recipe, create ".phony" or any other fake target without rules,
and add it to these targets dependency, e.g.:

echo: .phony
    @echo "hello world!"
    @touch echo

.PHONY: .phony

* Others
菜谱(recipe)可有可无, 生效的总是最后一份;
依赖可以多次重复定义, 顺序从后向前;
所有以'_'开头的伪目标, 默认为内部目标(不显示);
字符串变量中貌似不能含有'&'字符;
include 和 ifelse 总会执行;
```
