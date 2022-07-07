DOCKER_USERNAME ?= numb3r3
APPLICATION_NAME ?= nginx
VERSION_TAG ?= 0.0.1

build:
	docker build --tag ${DOCKER_USERNAME}/${APPLICATION_NAME}:${VERSION_TAG} --tag ${DOCKER_USERNAME}/${APPLICATION_NAME}:latest .

push:
	docker push ${DOCKER_USERNAME}/${APPLICATION_NAME}:${VERSION_TAG} --tag ${DOCKER_USERNAME}/${APPLICATION_NAME}:latest

buildx:
	docker buildx build --platform linux/amd64,linux/arm64 --push -t ${DOCKER_USERNAME}/${APPLICATION_NAME}:${VERSION_TAG} -t ${DOCKER_USERNAME}/${APPLICATION_NAME}:latest . -f Dockerfile