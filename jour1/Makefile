AWS_ACCOUNT ?= 747082607185
REGION      ?= eu-west-3
REPO        ?= web-bc
TAG         ?= 1.0

REGISTRY := $(AWS_ACCOUNT).dkr.ecr.$(REGION).amazonaws.com
IMAGE    := $(REGISTRY)/$(REPO):$(TAG)

.PHONY: login build push deploy

login:
	aws ecr get-login-password --region $(REGION) \
		| docker login --username AWS --password-stdin $(REGISTRY)

build:
	docker build -t $(IMAGE) .

push: login build
	docker push $(IMAGE)

deploy: push # pousse puis force le redéploiement du service
	aws ecs update-service --cluster bc-cluster \
		--service web-bc-svc --force-new-deployment --region $(REGION)
