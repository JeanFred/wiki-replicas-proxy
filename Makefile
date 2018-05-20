
.PHONY: all
all: build push

.PHONY: build
build:
	docker build ./mediawiki-core-empty -t mediawiki-core-empty
	docker build ./toolforge-proxy -t
	 toolforge-proxy

.PHONY: push
push:
	docker tag mediawiki-core-empty jeanfred/mediawiki-core-blank-db
	docker push jeanfred/mediawiki-core-blank-db
	docker tag toolforge-proxy jeanfred/wiki-replicas-toolforge-proxy
	docker push jeanfred/toolforge-wiki-replicas-proxy
