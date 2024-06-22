# Name of the main file (without extension)
MAIN = main

# Compiler
LATEX = pdflatex

# Default values for environment variables
EMAIL ?= UNSPECIFIED
PHONE ?= UNSPECIFIED

# Files to be removed during clean
CLEAN_FILES = $(MAIN).aux $(MAIN).log $(MAIN).out $(MAIN).toc $(MAIN).pdf $(MAIN).private.pdf

# Default rule
all: $(MAIN).private.pdf $(MAIN).pdf 

# Rule to build the main PDF with default values
$(MAIN).pdf: $(MAIN).tex
	EMAIL=HIDDEN PHONE=HIDDEN $(LATEX) $(MAIN).tex
	EMAIL=HIDDEN PHONE=HIDDEN $(LATEX) $(MAIN).tex

# Rule to build the private PDF with user-specified values
$(MAIN).private.pdf: $(MAIN).tex
	EMAIL=$(EMAIL) PHONE=$(PHONE) $(LATEX) $(MAIN).tex
	EMAIL=$(EMAIL) PHONE=$(PHONE) $(LATEX) $(MAIN).tex
	mv $(MAIN).pdf $(MAIN).private.pdf

# Rule to clean auxiliary files
clean:
	rm -f $(CLEAN_FILES)

.PHONY: all clean

