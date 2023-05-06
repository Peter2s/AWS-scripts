#!/usr/bin/env bash
#create key to access ec2 via ssh
aws ec2 create-key-pair --key-name 'p2s-key' --key-format 'pem' --query 'KeyMaterial' --output text > key.pem
# AMI id for ubounto ec2  ami-007855ac798b5175e

#create security group
aws ec2 create-security-group --group-name 'cli' --description 'createed from cli' --query 'GroupId'
#sg-042560e23739deacd
aws ec2 authorize-security-group-ingress --group-id sg-042560e23739deacd --protocol tcp  --port 22 --cidr 197.55.55.64/32

aws ec2 run-instances --image-id  ami-007855ac798b5175e --key-name p2s-key --instance-type t3.micro  --count 1 --security-group-ids sg-042560e23739deacd 

#ssh -i <keypath>.pem ubuntu@instance-public-dns-name