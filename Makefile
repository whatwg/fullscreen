ANOLIS = anolis

all: Overview.html data/xrefs/dom/fullscreen.json

Overview.html: Overview.src.html data Makefile
	$(ANOLIS) --w3c-compat-substitutions \
	--omit-optional-tags --quote-attr-values --enable=xspecxref \
	--w3c-shortname="notifications" \
	--enable=refs --filter=".publish" $< $@

data/xrefs/dom/fullscreen.json: Overview.src.html Makefile
	$(ANOLIS) --dump-xrefs=$@ $< /tmp/spec

publish: Overview.src.html data Makefile
	$(ANOLIS) --output-encoding=ascii --omit-optional-tags --quote-attr-values \
	--w3c-compat-substitutions --enable=xspecxref --enable=refs --w3c-shortname="fullscreen" \
	--filter=".dontpublish" --pubdate="$(PUBDATE)" --w3c-status=WD \
	$< TR.html
