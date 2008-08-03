# MakeFile
# xstress - xk0derz SMTP Stress Tester
#
# (c) Amit Singh, amitcz@yahoo.com
# http://xk0der.wordpress.com
#
# This software and related files are licensed under GNU GPL version 2
# Please visit the following webpage for more details
# http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
# or read the accopanying LICENSE file.
# 
# View the README file for usage directions
# and help of editing the configuration file
#

OBJ_DIR=obj
SRC_DIR=src
INCLUDE_DIR=include
BIN_DIR=bin

OBJS=$(OBJ_DIR)/xstress.o $(OBJ_DIR)/sendmail.o \
     $(OBJ_DIR)/config.o \
     $(OBJ_DIR)/thread.o \
     $(OBJ_DIR)/logger.o \
     $(OBJ_DIR)/userinterface.o

B64_SRC=$(SRC_DIR)/b64.c
B64_OUT=$(BIN_DIR)/base64

PROG=$(BIN_DIR)/xstress

GPP=g++
GCC=gcc
LD=ld


.PHONY: all
.PHONY: clean

all: $(PROG)

$(OBJS):
	$(GPP) $(addsuffix .cc, $(basename $(subst $(OBJ_DIR),$(SRC_DIR),$@))) -c  -I$(INCLUDE_DIR) -o $@

$(PROG): $(OBJS) $(B64_OUT)
	$(GPP) $(OBJS) -o $(PROG)

$(B64_OUT):
	$(GCC) $(B64_SRC) -o $(B64_OUT)

clean:
	rm -f $(OBJS)
	rm -f $(PROG)
	rm -f $(B64_OUT)

install: 
	cp xstress /usr/local/bin

uninstall:
	rm -i /usr/local/bin/xstress 
