from datetime import datetime
import boto3
import logging
from botocore.exceptions import ClientError
import os

currentDatetime = datetime.now()

strCurrentatetime = str(currentDatetime)

file = open("currentdate.txt", 'w')
file.write(strCurrentatetime)
file.close()


def upload_file(fileName, bucket, object_name=None):

    if object_name is None:
        object_name = os.path.basename(fileName)

    s3_client = boto3.cleint('s3')
    try:
        response = s3_client.upload_file(
            "currentdate.txt", "builders01-bucket")
    except ClientError as e:
        logging.error(e)
        return False
    return True
