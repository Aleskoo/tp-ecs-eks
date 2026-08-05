REGION      ?= eu-west-3
ALB_DNS     ?= web-bc-alb-1267814203.eu-west-3.elb.amazonaws.com

.PHONY: alb-url loadtest

alb-url:
	@echo http://$(ALB_DNS)/

loadtest:
	for i in $$(seq 1 200); do curl -s -o /dev/null -w "%{http_code}\n" http://$(ALB_DNS)/ & done; wait
