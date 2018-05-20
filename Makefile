
.PHONY: all
all: build push

.PHONY: build
build:
	docker build ./mediawiki-core-empty -t mediawiki-core-blank-db
	docker build ./toolforge-proxy -t wiki-replicas-proxy

.PHONY: push
push:
	docker tag mediawiki-core-blank-db jeanfred/mediawiki-core-blank-db
	docker push jeanfred/mediawiki-core-blank-db
	docker tag wiki-replicas-proxy jeanfred/wiki-replicas-proxy
	docker push jeanfred/wiki-replicas-proxy
