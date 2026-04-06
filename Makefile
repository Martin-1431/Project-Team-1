.PHONY: compile run clean help

# Variables
JAVAC = javac
JAVA = java
SRC_DIR = src
BIN_DIR = bin
LIB_DIR = lib
MYSQL_JAR = $(LIB_DIR)/mysql-connector-j-9.6.0.jar
MAIN_CLASS = AutoDBApp

# OS-specific classpath separator
ifeq ($(OS),Windows_NT)
PATHSEP = ;
else
PATHSEP = :
endif

# Classpath for compilation and execution
COMPILE_CP = $(MYSQL_JAR)
RUNTIME_CP = $(BIN_DIR)$(PATHSEP)$(MYSQL_JAR)

help:
	@echo "AutoDBApp - Available targets:"
	@echo "  make compile  - Compile the project"
	@echo "  make run      - Compile and run the application"
	@echo "  make clean    - Remove compiled class files"
	@echo "  make help     - Show this help message"

compile:
	@echo "Compiling $(SRC_DIR)/*.java to $(BIN_DIR)/..."
	$(JAVAC) -cp "$(COMPILE_CP)" $(SRC_DIR)/*.java -d $(BIN_DIR)
	@echo "Compilation complete!"

run: compile
	@echo "Running $(MAIN_CLASS)..."
	$(JAVA) -cp "$(RUNTIME_CP)" $(MAIN_CLASS)

clean:
	@echo "Cleaning up..."
	del /Q $(BIN_DIR)\*.class 2>nul || true
	@echo "Clean complete!"
