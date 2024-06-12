#!/bin/bash

ENV="dev"
REGION="us-west-2"

echo "ENV: $ENV"
echo "REGION: $REGION"

S3_BUCKET_DESIGN_SYSTEM="desing-system-assets-$ENV"

# sofom
if aws s3 ls "s3://$S3_BUCKET_DESIGN_SYSTEM" 2>&1 | grep -q 'NoSuchBucket'
then
    echo "Bucket does not exist"
    exit 1
else
    echo "SYCNING DESIGN SYSTEM BUCKET"
    aws s3 sync ./assets s3://$S3_BUCKET_DESIGN_SYSTEM --exclude "*DS_Store" --exclude "**/*.DS_Store"
    echo "DESIGN SYSTEM BUCKET SYNCHED"
fi