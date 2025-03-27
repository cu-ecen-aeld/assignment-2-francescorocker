# Makefile for assignment 2

CC ?= gcc
CROSS_COMPILE ?= 
TARGET = writer

# Path for output
OUTDIR = build

# Source files
SRC = finder-app/writer.c
OBJ = $(OUTDIR)/writer.o

# Output executable
EXEC = $(OUTDIR)/$(TARGET)

# Output file for file command
FILE_OUTPUT = assignments/assignment2/fileresult.txt

# Compiler flags
CFLAGS = -Wall -g

# Check if CROSS_COMPILE is set and adjust CC accordingly
ifeq ($(CROSS_COMPILE),)
    # Native compile
    CC = gcc
else
    # Cross compile
    CC = $(CROSS_COMPILE)gcc
endif

# Default target
all: $(EXEC) check_file

# Create the output directory
$(OUTDIR):
	mkdir -p $(OUTDIR)

# Compile the writer program
$(EXEC): $(OUTDIR) $(OBJ)
	$(CC) $(OBJ) -o $(EXEC)

# Compile the source code into object file
$(OBJ): $(SRC)
	$(CC) $(CFLAGS) -c $(SRC) -o $(OBJ)

# Run the file command and output the result to fileresult.txt
check_file: $(EXEC)
	@echo "Checking file type of $(EXEC)..." 
	@file $(EXEC) > $(FILE_OUTPUT)
	@echo "File type information written to $(FILE_OUTPUT)"

# Clean the build
clean:
	rm -rf $(OUTDIR) $(FILE_OUTPUT)

.PHONY: all clean check_file
