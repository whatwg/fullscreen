ANOLIS = anolis

all: Overview.html data/xrefs/dom/fullscreen.json

Overview.html: Overview.src.html data Makefile
	$(ANOLIS) --omit-optional-tags --quote-attr-values \
	--enable=xspecxref --enable=refs --w3c-shortname="fullscreen" \
	--filter=".publish" $< $@

data/xrefs/dom/fullscreen.json: Overview.src.html Makefile
	$(ANOLIS) --dump-xrefs=$@ $< /tmp/spec

publish: Overview.src.html data Makefile
	$(ANOLIS) --output-encoding=ascii --omit-optional-tags --quote-attr-values \
	--w3c-compat --enable=xspecxref --enable=refs --w3c-shortname="fullscreen" \
	--filter=".dontpublish" --pubdate="$(PUBDATE)" --w3c-status=WD \
	$< TR.html
