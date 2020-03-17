NAME = pgadmin4-s3-sidecar

.PHONY: build release

build:
	docker build -t $(NAME):latest .

release:
	docker push $(NAME):latest
