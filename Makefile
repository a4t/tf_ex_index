VERSION_FILE=.version
NOW_VERSION:=$(shell cat ${VERSION_FILE})
INCREMENT_PARAM=bug

init:
	docker-compose pull
	docker-compose run terraform init

test:
	docker-compose run terraform apply -auto-approve

version+:;   $(MAKE) version-increment INCREMENT_PARAM=bug
version++:;  $(MAKE) version-increment INCREMENT_PARAM=feature
version+++:; $(MAKE) version-increment INCREMENT_PARAM=major
version-increment:
	./utils/version.sh ${NOW_VERSION} ${INCREMENT_PARAM} > ${VERSION_FILE}

release-tag:
	git tag ${NOW_VERSION}
	git push origin ${NOW_VERSION}
