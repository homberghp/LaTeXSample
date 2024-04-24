#
# Makefile for the latex documentation of this project
# @author Pieter van den Hombergh number 879417
# $Id: Makefile 320 2007-05-17 19:10:36Z hom $
# define some flags
LATEX=pdflatex
BIBTEX=biber
# bibtex
LATEXFLAGS=--interaction=batchmode
# How to produce the pdf from .tex files: 
# run pdfelatex to 
# get the references right.
# to process a Latex doc into a PDF document
%.pdf: %.tex
	$(LATEX) $(LATEXFLAGS) $<
	$(BIBTEX)  $*
	$(LATEX) $(LATEXFLAGS) $<
	$(LATEX) $(LATEXFLAGS) $<

# first some definitions
TARGET=main.pdf
BARCODE=12345
PARTS=main.tex mydefs.tex intro.tex \
	motivation.tex \
	graphics.tex mathematics.tex \
	codelisting.tex Makefile code/hello.c figures/barcode.pdf \
	poser.tex frontpage.tex simple.tex programmedgraphics.tex \
	figures/servlet3.png figures/Diagram1.pdf figures/fon000_00c.pdf

# things that may be thrown away 
DISPOSABLES= *~ *.aux *.log *.o hello *.blg *.bbl *.bcf *.lol *.run.xml *.fls *.lof *.out *.svt *.toc


# define the default target
all: main.pdf

main.pdf: main.tex $(PARTS)

#define a phony target
.PHONY: clean distclean

clean:
	rm -f $(DISPOSABLES)

distclean: clean
	rm -f $(TARGET) *.toc *.out *.url *.lof


