#*******************************************************************************
# Justin M Selfridge, PhD
# Gradient Consulting, LLC
# jselfridge@gmail.com
# Makefile (XPlane)
#******************************************************************************/

TARGET      := XPlaneTest

CC          := gcc
LINKER      := gcc -o

WFLAGS      := -Wall -Wextra -Werror=float-equal -Wuninitialized -Wunused-variable -Wdouble-promotion
CFLAGS      := -g -c -Wall
LFLAGS      := -lm  # -pthread -lrt -l:librobotcontrol.so.1

SOURCES     := $(shell find ./ -name '*.c')
INCLUDES    := $(shell find ./ -name '*.h')
OBJECTS     := $(SOURCES:$%.c=$%.o)

#prefix      := /usr/local
#RM          := rm -f
#INSTALL     := install -m 4755
#INSTALLDIR  := install -d -m 755

#LINK        := ln -s -f
#LINKDIR     := /etc/robotcontrol
#LINKNAME    := link_to_startup_program

#FILE        := ../param/sys_type
#SYSTYPE     := $(shell cat ${FILE})


#$(TARGET): $(OBJECTS)
#	@$(LINKER) $(@) $(OBJECTS) $(LFLAGS)
#	@echo "Made: $@"

#$(OBJECTS): %.o : %.c $(INCLUDES)
#	@$(CC) $(CFLAGS) $(WFLAGS) $(DEBUGFLAG) -D $(SYSTYPE) -c $< -o $(@)
#	@echo "Compiled: "$<


#all: $(TARGET)

#debug:
#	$(MAKE) $(MAKEFILE) DEBUGFLAG="-g -D DEBUG"
#	@echo " "
#	@echo "$(TARGET) Make Debug Complete"
#	@echo " "

#install:
#	@$(MAKE) --no-print-directory
#	@$(INSTALLDIR) $(DESTDIR)$(prefix)/bin
#	@$(INSTALL) $(TARGET) $(DESTDIR)$(prefix)/bin
#	@echo "$(TARGET) Install Complete"

#clean:
#	@$(RM) $(OBJECTS)
#	@$(RM) $(TARGET)
#	@echo "$(TARGET) Clean Complete"

#uninstall:
#	@$(RM) $(DESTDIR)$(prefix)/bin/$(TARGET)
#	@echo "$(TARGET) Uninstall Complete"

#runonboot:
#	@$(MAKE) install --no-print-directory
#	@$(LINK) $(DESTDIR)$(prefix)/bin/$(TARGET) $(LINKDIR)/$(LINKNAME)
#	@echo "$(TARGET) Set to Run on Boot"

