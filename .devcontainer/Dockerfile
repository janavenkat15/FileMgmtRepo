# Docker file that installs Terraform on ubuntu image

FROM ubuntu:focal

ARG TERRAFORM_VERSION

RUN apt update && apt install -y gnupg software-properties-common curl unzip

RUN curl -O "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_$(dpkg --print-architecture).zip"

RUN unzip "terraform_${TERRAFORM_VERSION}_linux_$(dpkg --print-architecture).zip" -d /bin
