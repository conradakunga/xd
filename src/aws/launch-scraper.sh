#!/bin/bash -x

source src/aws/config

XD_PROFILE="arn:aws:iam::165509303398:instance-profile/xd-scraper" 

ami_id=ami-75fd3b15 #Ubuntu Server 16.04 LTS (HVM)

#  created via IAM console: role/xd-scraper
aws ec2 run-instances \
      --key-name $KEY \
      --region ${REGION} \
      --instance-type r3.large \
      --instance-initiated-shutdown-behavior terminate \
      --iam-instance-profile Arn="$XD_PROFILE" \
      --user-data file://src/aws/userdata-bootstrap.sh \
      --image-id $ami_id

