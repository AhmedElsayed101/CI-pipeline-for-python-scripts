.ONESHELL:
.SHELL := /usr/bin/bash
.PHONY: apply-jenkins-plan clean destroy fmt graph inputs jenkins-plan validate

export TF_IN_AUTOMATION=1
export TF_INPUT=0

fmt:
	@terraform fmt -recursive

validate: fmt
	@test -f secrets.env && . ./secrets.env || true
	@terraform init -backend=false -lock=false
	@terraform validate

jenkins-plan: validate
	@test -f secrets.env && . ./secrets.env || true
	@terraform init
	@terraform plan -out=plan.tfplan

apply-jenkins-plan:
	@test -f secrets.env && . ./secrets.env || true
	@terraform apply -refresh=false plan.tfplan
	@rm -f plan.tfplan

destroy:
	@test -f secrets.env && . ./secrets.env || true
	@terraform plan -destroy -out=plan.tfplan
	@terraform apply -refresh=false plan.tfplan
	@rm -f plan.tfplan

providers:
	@terraform providers

graph:
	@terraform graph


clean: fmt
	@find . -depth -type d -a '(' \
		-name '.terraform' \
		-o \
		-name '*.backup' \
	')' -exec rm -rf '{}' +
	@find . -depth -type f -a '(' \
		-name '*.log' \
		-o \
		-name '*.tfstate' \
		-o \
		-name '*.tfstate.*' \
		-o \
		-name '*.tfplan' \
		-o \
		-name '*.backup' \
		-o \
		-name '*.backup.md' \
	')' -exec rm -rf '{}' +