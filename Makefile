# Container Control

CONTAINER=iandennismiller/python

all: build run
	@echo ok

run:
	docker run -it $(CONTAINER)

daemonize:
	docker run -d $(CONTAINER)

build:
	docker build -t $(CONTAINER):latest .

rebuild:
	docker build --no-cache -t $(CONTAINER):latest .

push:
	docker push $(CONTAINER)

.PHONY: all run daemonize build push
