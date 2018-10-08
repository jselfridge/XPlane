#*******************************************************************************
# Justin M Selfridge, PhD
# Gradient Consulting, LLC
# jselfridge@gmail.com
# Makefile (XPlaneTest)
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

RM          := rm -f


$(TARGET): $(OBJECTS)
	@$(LINKER) $(@) $(OBJECTS) $(LFLAGS)
	@echo "Made: $@"

$(OBJECTS): %.o : %.c $(INCLUDES)
	@$(CC) $(CFLAGS) $(WFLAGS) $(DEBUGFLAG) -c $< -o $(@)
	@echo "Compiled: "$<


all: $(TARGET)

debug:
	$(MAKE) $(MAKEFILE) DEBUGFLAG="-g -D DEBUG"
	@echo " "
	@echo "$(TARGET) Make Debug Complete"
	@echo " "

clean:
	@$(RM) $(OBJECTS)
	@$(RM) $(TARGET)
	@echo "$(TARGET) Clean Complete"

#install:
#	@$(MAKE) --no-print-directory
#	@$(INSTALLDIR) $(DESTDIR)$(prefix)/bin
#	@$(INSTALL) $(TARGET) $(DESTDIR)$(prefix)/bin
#	@echo "$(TARGET) Install Complete"

#uninstall:
#	@$(RM) $(DESTDIR)$(prefix)/bin/$(TARGET)
#	@echo "$(TARGET) Uninstall Complete"

#runonboot:
#	@$(MAKE) install --no-print-directory
#	@$(LINK) $(DESTDIR)$(prefix)/bin/$(TARGET) $(LINKDIR)/$(LINKNAME)
#	@echo "$(TARGET) Set to Run on Boot"


