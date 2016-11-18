local: fullscreen.bs
	bikeshed

remote: fullscreen.bs
	curl https://api.csswg.org/bikeshed/ -f -F file=@fullscreen.bs > fullscreen.html
