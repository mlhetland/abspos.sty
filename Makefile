TARGETS=abspos.pdf abspos.sty

LATEX=latexmk -norc -pdf -auxdir=build -outdir=build
TEX=tex
TOUCH=touch
RM=rm
SED=sed

all: $(TARGETS)

clean:
	$(RM) -f $(TARGETS) build/*

force: clean all

VERSION=$$(cat VERSION)
DATE=$$(date -r VERSION +%Y-%m-%d)
YEAR=$$(date -r VERSION +%Y)
SUBST1="s/\(Copyright (c) 2021-\)[^ ]*/\1$(YEAR)/"
SUBST2="s/\(ProvidesExplPackage {abspos}\) .*/\1 {$(DATE)} {$(VERSION)}/"
bump:
	$(SED) -i "" \
	-e $(SUBST1) \
	-e $(SUBST2) \
	abspos.dtx

build/abspos.pdf: abspos.dtx build/demo.pdf
	$(LATEX) $<

build/demo.pdf: demo.tex abspos.sty
	$(LATEX) $<

abspos.sty: abspos.dtx VERSION
	$(TEX) $<
	$(RM) abspos.log

%: build/%
	cp $< $@
