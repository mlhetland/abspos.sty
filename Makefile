TARGETS=abspos.pdf abspos.sty

LATEX=latexmk -norc -pdf -auxdir=build -outdir=build
TEX=tex
TOUCH=touch
RM=rm
SED=sed

all: $(TARGETS)

build/abspos.pdf: abspos.dtx build/demo.pdf
	$(LATEX) $<

build/demo.pdf: demo.tex abspos.sty
	$(LATEX) $<

abspos.sty: abspos.dtx VERSION
	$(TEX) $<
	$(RM) abspos.log
	$(SED) -i "" -e "s/{VERSION}/{$$(cat VERSION)}/" \
		-e "s/{DATE}/{$$(date +%Y-%m-%d)}/" abspos.sty

%: build/%
	cp $< $@
