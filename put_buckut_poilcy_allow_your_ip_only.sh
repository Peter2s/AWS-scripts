#!/usr/bin/env bash
echo "this script for allow your ip only to access s3 bucket"
read -p "enter your bucket name : " bucketName
read -p "enter your policy file path : " policyFilePath
aws s3api put-bucket-policy --bucket $bucketName --policy file://$policyFilePath