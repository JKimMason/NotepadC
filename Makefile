# ------------------------------------
# Makefile NotepadInC
# ------------------------------------

# ------------------
# Compiler
# ------------------
CC       = gcc
OPTS 	 = -g -O0
DEBUG	 = -Wall -Wextra -pedantic
YRS		 = -std=c99
CFLAGS   = $(OPTS) $(INCLUDE) $(YRS) $(DEBUG)

# -------------------
# Name of Directories
# -------------------
SRCDIR   = src
OBJDIR   = obj
INCDIR   = inc
BINDIR   = bin

# -------------------
# Define flags
# -------------------
SRCS 	 := $(wildcard $(SRCDIR)/*.c)
INCLUDE := $(addprefix -I, $(INCDIR))
OBJS  	 := $(SRCS:$(SRCDIR)/%.c=$(OBJDIR)/%.o)
rm       := rm -f

# -------------------
# Name of executable
# -------------------
TARGET = $(BINDIR)/test

all: $(TARGET)

$(TARGET): $(OBJS) 
	${CC} ${CFLAGS} -o $@ $(OBJS)

$(OBJS): $(OBJDIR)/%.o : $(SRCDIR)/%.c
	@$(CC) $(CFLAGS) -c $< -o $@
	@echo "Compiled "$<" successfully!"

# -------------------
# Clean: remove all obj file
# -------------------
.PHONY: remove
clean:
	@$(rm) $(OBJS)
	@echo "Obj files removed!"

# -------------------
# Clean: remove exe
# -------------------
remove: clean
	@$(rm) $(BINDIR)/$(TARGET)
	@echo "Exe files removed!".PHONY: remove

# -------------------
# Cleanall: Remove obj and exe
cleanall:
	@$(rm) $(OBJS)
	@$(rm) $(BINDIR)/$(TARGET) 
	@echo "Obj and Exe files removed!".PHONY: remove
# -------------------------------------------
