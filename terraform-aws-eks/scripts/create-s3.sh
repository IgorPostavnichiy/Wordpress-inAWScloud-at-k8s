#!/bin/bash

bucket_name="s3-bucket-test-itsprout"
region="eu-north-1"

aws s3api head-bucket --bucket "$bucket_name"  2>/dev/null
# aws s3api create-bucket --bucket "$bucket_name" --region eu-north-1 2>/dev/null


if [[ $? -eq 0 ]]; then
  echo "Bucket $bucket_name alredy exist."
else
  aws s3api create-bucket --bucket "$bucket_name" 
  echo "Bucket $bucket_name created successfully."
fi


#!/bin/bash

# bucket_name="your-bucket-name"
# region="eu-north-1"

# aws s3api create-bucket --bucket "$bucket_name" --region "$region" --create-bucket-configuration LocationConstraint="$region"
