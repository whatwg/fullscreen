ANOLIS = anolis

all: Overview.html data/xrefs/dom/fullscreen.json

Overview.html: Overview.src.html data Makefile
	$(ANOLIS) --omit-optional-tags --quote-attr-values \
	--enable=xspecxref --enable=refs --w3c-shortname="fullscreen" \
	--filter=".publish" $< $@

data/xrefs/dom/fullscreen.json: Overview.src.html Makefile
	$(ANOLIS) --dump-xrefs=$@ $< /tmp/spec
