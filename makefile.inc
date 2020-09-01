PROJ_DIR ?= $(shell pwd)
export EXP1_ENV ?= "export env1 in makefile.inc"

# ========================================================================================

%.o: %.c
	$(CC) $(INCFLAG) $(CFLAG) -fPIC -O2 -o $@ -c $< 

%.o: %.cpp
	$(CXX) $(INCFLAG) $(CPPFLAG) -fPIC -O2 -o $@ -c $< 
