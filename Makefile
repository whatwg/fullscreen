SHELL=/bin/bash -o pipefail
.PHONY: local remote deploy review

remote: fullscreen.bs
	curl https://api.csswg.org/bikeshed/ -f -F file=@fullscreen.bs > fullscreen.html -F md-Text-Macro="SNAPSHOT-LINK LOCAL COPY"

local: fullscreen.bs
	bikeshed spec fullscreen.bs fullscreen.html --md-Text-Macro="SNAPSHOT-LINK LOCAL COPY"

deploy: fullscreen.bs
	curl --remote-name --fail https://resources.whatwg.org/build/deploy.sh
	bash ./deploy.sh

review: fullscreen.bs
	curl --remote-name --fail https://resources.whatwg.org/build/review.sh
	bash ./review.sh
