SHELL=/bin/bash -o pipefail
.PHONY: local remote deploy

remote: fullscreen.bs
	@ (HTTP_STATUS=$$(curl https://api.csswg.org/bikeshed/ \
	                       --output fullscreen.html \
	                       --write-out "%{http_code}" \
	                       --header "Accept: text/plain, text/html" \
	                       -F die-on=warning \
	                       -F md-Text-Macro="COMMIT-SHA LOCAL COPY" \
	                       -F file=@fullscreen.bs) && \
	[[ "$$HTTP_STATUS" -eq "200" ]]) || ( \
		echo ""; cat fullscreen.html; echo ""; \
		rm -f fullscreen.html; \
		exit 22 \
	);

local: fullscreen.bs
	bikeshed spec fullscreen.bs fullscreen.html --md-Text-Macro="COMMIT-SHA LOCAL-COPY"

deploy: fullscreen.bs
	curl --remote-name --fail https://resources.whatwg.org/build/deploy.sh
	bash ./deploy.sh
