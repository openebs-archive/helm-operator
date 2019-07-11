# Makefile for building openebs helm-operator and its tools
# Reference Guide - https://www.gnu.org/software/make/manual/make.html

REPONAME = openebs
IMGNAME = helm-operator
IMGTAG = v0.0.2
OPENEBS_RELEASE_VERSION = 1.0.0
IS_DOCKER_INSTALLED = $(shell which docker >> /dev/null 2>&1; echo $$?)

.PHONY: all
all: build image registry

.PHONY: deps
deps: _build_check_docker

_build_check_docker:
	@if [ $(IS_DOCKER_INSTALLED) -eq 1 ]; \
		then echo "" \
		&& echo "ERROR:\tdocker is not installed. Please install it before build." \
		&& echo "" \
		&& exit 1; \
		fi;

.PHONY: build
build: 
	@echo "------------------------------------"
	@echo "Fetch openebs helm chart from stable"
	@echo "------------------------------------"
     
	helm init --client-only
	helm fetch stable/openebs --version $(OPENEBS_RELEASE_VERSION) --untar --untardir helm-charts/
	ls helm-charts/
	./hack/pre-install

.PHONY: image
image:
	@echo "------------------------------------"
	@echo "Build the helm operator image"
	@echo "------------------------------------"

	docker build . -f build/Dockerfile -t $(REPONAME)/$(IMGNAME):$(IMGTAG)

.PHONY: registry
registry:
	@echo "------------------------------------"
	@echo "push the operator image to registry"
	@echo "------------------------------------"

	REPONAME=$(REPONAME) IMGNAME=$(IMGNAME) IMGTAG=$(IMGTAG) ./hack/push

