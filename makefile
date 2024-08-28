# Name of the project
PROJ_NAME=mainFile.exe

C_DIR=./
H_DIR=./
O_DIR=./

C_SOURCE=$(wildcard $(C_DIR)*.c)
H_SOURCE=$(wildcard $(H_DIR)*.h)
O_SOURCE=$(wildcard $(O_DIR)*.c)

# Compiler and linker
CC=gcc

# Flags for compiler
CC_FLAGS=-c         \
         -W         \
         -Wall      \
         -ansi      \
         -pedantic

# Command used at clean target
RM = rm -rf

#
# Compilation and linking
#
all: $(PROJ_NAME)

$(PROJ_NAME): $(OBJ)
	$(CC) $^ -o $(PROJ_NAME) $(O_SOURCE)

$(O_DIR)%.o: $(C_DIR)%.c $(H_DIR)%.h
	$(CC) $< $(CC_FLAGS) -o $@

$(O_DIR)/main.o: $(C_DIR)main.c $(H_SOURCE)
	$(CC) $< $(CC_FLAGS) -o $@

.PHONY: all