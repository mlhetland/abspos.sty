TARGETS=place.pdf place.sty

LATEX=latexmk -norc -pdf -auxdir=build -outdir=build
TEX=tex
TOUCH=touch
RM=rm
SED=sed

all: $(TARGETS)

build/place.pdf: place.dtx build/demo.pdf
	$(LATEX) $<

build/demo.pdf: demo.tex place.sty
	$(LATEX) $<

place.sty: place.dtx
	$(TEX) $<
	$(RM) place.log
	$(SED) -i "" -e "s/{VERSION}/{$$(cat VERSION)}/" \
		-e "s/{DATE}/{$$(date +%Y-%m-%d)}/" place.sty

%: build/%
	cp $< $@
