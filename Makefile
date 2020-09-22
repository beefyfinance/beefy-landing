.EXPORT_ALL_VARIABLES:
.SUFFIXES:
MAKEFLAGS += --no-builtin-variables

SRC := $(PWD)/src
OUT := $(PWD)/dist
PRD := $(PWD)/../beefyfinance.github.io

.DEFAULT_GOAL := all

clean:
	rm -r $(OUT)

dir:
	mkdir -p $(OUT)

static: dir
	cp $(SRC)/favicon.ico $(SRC)/robots.txt $(OUT)/
	cp -rf $(SRC)/img $(OUT)/img
	cp -rf $(SRC)/css $(OUT)/css
	#cp -rf $(SRC)/js $(OUT)/js

landing: dir
	pug -b src < $(SRC)/pug/index.pug > $(OUT)/index.html

not_found: dir
	pug -b src < $(SRC)/pug/index.pug > $(OUT)/404.html

html: landing not_found

all: static html

run:
	http-server $(OUT) -p 3698

deploy:
	cp -rf $(OUT)/* $(PRD)