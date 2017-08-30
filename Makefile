local: fullscreen.bs
	bikeshed spec fullscreen.bs fullscreen.html --md-Text-Macro="SNAPSHOT-LINK LOCAL COPY"

remote: fullscreen.bs
	curl https://api.csswg.org/bikeshed/ -f -F file=@fullscreen.bs > fullscreen.html -F md-Text-Macro="SNAPSHOT-LINK LOCAL COPY"

deploy: fullscreen.bs
	curl --remote-name --fail https://raw.githubusercontent.com/whatwg/common-build/master/deploy.sh && bash ./deploy.sh
