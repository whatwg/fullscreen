local: fullscreen.bs
	bikeshed spec fullscreen.bs fullscreen.html --md-Text-Macro="SNAPSHOT-LINK LOCAL COPY"

remote: fullscreen.bs
	curl https://api.csswg.org/bikeshed/ -f -F file=@fullscreen.bs > fullscreen.html -F md-Text-Macro="SNAPSHOT-LINK LOCAL COPY"
