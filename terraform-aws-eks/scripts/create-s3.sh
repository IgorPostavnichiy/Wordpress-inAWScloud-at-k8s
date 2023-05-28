#!/bin/bash

bucket_name="s3-bucket-test-itsprout"
region="eu-north-1"

aws s3api create-bucket --bucket "$bucket_name" --region "$region" --create-bucket-configuration LocationConstraint="$region"
