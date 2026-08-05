REGION      ?= eu-west-3
CLUSTER     ?= bc-eks
ALB_DNS     ?= web-bc-alb-1267814203.eu-west-3.elb.amazonaws.com
REPLICAS    ?= 5

.PHONY: cluster-up kubeconfig deploy scale cluster-down alb-url loadtest

cluster-up:
	eksctl create cluster -f cluster.yaml

kubeconfig:
	aws eks update-kubeconfig --name $(CLUSTER) --region $(REGION)

deploy:
	kubectl apply -f k8s/

scale:
	kubectl scale deployment web --replicas=$(REPLICAS)

cluster-down:
	eksctl delete cluster --name $(CLUSTER) --region $(REGION)

alb-url:
	@echo http://$(ALB_DNS)/

loadtest:
	for i in $$(seq 1 200); do curl -s -o /dev/null -w "%{http_code}\n" http://$(ALB_DNS)/ & done; wait
