# ------------------------------------
# Makefile NotepadInC
# ------------------------------------


# ------------------
# Compiler
# ------------------
CC       = gcc
# compiling flags here
CFLAGS   = -std=c99 -Wall -I.

# ------------------
# Linker
# ------------------
LINKER   = gcc
# linking flags here
LFLAGS   = -Wall -I. -lm

# -------------------
# Name of Directories
# -------------------
SRCDIR   = src
OBJDIR   = obj
INCDIR   = inc
BINDIR   = bin

# -------------------
# Source Directory: Name each files
# -------------------
SRCS=$(SRCDIR)/kilo.c



# -------------------
# Define flags
# -------------------
SOURCES  := $(wildcard $(SRCDIR)/*.c)
INCLUDES := $(addprefix -I, $(INCDIR)/*.h)
OBJS  := $(SRCS:$(SRCDIR)/%.c=$(OBJDIR)/%.o)
rm       = rm -f

# -------------------
# Name of executable
# -------------------
TARGET = $(BINDIR)/kilo

all: $(TARGET)

$(TARGET): $(OBJS) 
	${CC} ${CFLAGS} -o $@ $(OBJS)
	@echo "Linking complete!"

$(OBJS): $(OBJDIR)/%.o : $(SRCDIR)/%.c
	@$(CC) $(CFLAGS) -c $< -o $@
	@echo "Compiled "$<" successfully!"


# -------------------
# Clean: remove all obj file
# -------------------
.PHONY: remove
clean:
	@$(rm) $(OBJS)
	@echo "Obj removed!"

# -------------------
# Clean: remove exe
# -------------------
remove: clean
	@$(rm) $(BINDIR)/$(TARGET)
	@echo "Executable removed!".PHONY: remove

# -------------------
# Cleanall: Remove obj and exe
cleanall:
	@$(rm) $(OBJS)
	@$(rm) $(BINDIR)/$(TARGET) 
	@echo "Obj and Executable removed!".PHONY: remove
# -------------------------------------------
