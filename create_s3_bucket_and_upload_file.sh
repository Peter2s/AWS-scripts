#!/usr/bin/env bash
# aws cli configuration
#aws configure
echo "hello to my script..."
echo "================================================"
#create s3 bucket

read -p 'enter your bucket name here:' bucketName
aws s3api create-bucket \
    --bucket $bucketName \
    --region us-east-1 \
    --object-ownership BucketOwnerPreferred

# block open public access

aws s3api put-public-access-block \
    --bucket $bucketName \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"

#upload file to s3 bucket
read -p'enter your file name' fileName
read -p 'enter your file path' filePath
aws s3api put-object --bucket $bucketName --key $fileName --body $filePath

# remove public access block
aws s3api delete-public-access-block \
    --bucket $bucketName

# one read only to every one
aws s3api put-object-acl --bucket $bucketName --key $fileName --acl public-read
