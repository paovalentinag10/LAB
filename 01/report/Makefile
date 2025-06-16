MD_FILES := $(wildcard *.md)
DOCX_FILES := $(MD_FILES:.md=.docx)
PDF_FILES := $(MD_FILES:.md=.pdf)

FILTERS := --filter pandoc-crossref
PDF_ENGINE := --pdf-engine=xelatex
PDF_OPTS := --pdf-engine-opt=--shell-escape
COMMON_OPTS := --number-sections --citeproc

all: $(DOCX_FILES) $(PDF_FILES)

%.docx: %.md
 pandoc $< $(FILTERS) $(COMMON_OPTS) -o $@

%.pdf: %.md
 pandoc $< $(FILTERS) $(PDF_ENGINE) $(PDF_OPTS) $(COMMON_OPTS) -o $@

clean:
 rm -f *.pdf *.docx