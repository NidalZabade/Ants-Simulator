# Directories
BIN_DIR = ./build/bin
OBJ_DIR = ./build/obj
SRC_DIR = ./src
# Sources
SOURCES = $(SRC_DIR)/main.c # use \ filename to append another files
OBJECT_NAMES = $(SOURCES:.c=.o)
OBJECTS = $(OBJ_DIR)/main.o #$(pathsubst %, $(OBJ_DIR)/%, $(OBJECT_NAMES))
TARGET = $(OBJ_DIR)/main.o
# Flags
WFLAGS = -Wall -Wshadow #Werror shows warrning as errors, -Wextra
UIFLAGS = `sdl2-config --libs --cflags` -ggdb3 -O0 --std=c99 -Wall -lm -g
CC = gcc
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -o $@ $^

.PHONY: all clean run gui
run: $(TARGET)
	$(TARGET)
all: $(TARGET)
clean:
	rm -r $(OBJ_DIR)/
	# rm -r  $(BIN_DIR)/
gui: 
	@mkdir -p build/bin
	$(CC) $(UIFLAGS) $(SRC_DIR)/ui.c -o $(BIN_DIR)/ui
	$(BIN_DIR)/ui