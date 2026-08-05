REGION      ?= eu-west-3
CLUSTER     ?= bc-eks
TF_DIR      := terraform
REPLICAS    ?= 5

.PHONY: init plan apply destroy kubeconfig deploy scale

init:
	cd $(TF_DIR) && terraform init

plan:
	cd $(TF_DIR) && terraform plan -out=tfplan

apply:
	cd $(TF_DIR) && terraform apply tfplan

destroy:
	cd $(TF_DIR) && terraform destroy

kubeconfig:
	aws eks update-kubeconfig --name $(CLUSTER) --region $(REGION)

deploy:
	kubectl apply -f k8s/

scale:
	kubectl scale deployment web --replicas=$(REPLICAS)
