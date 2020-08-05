import boto3

client = boto3.client("lambda")


resp1 = client.create_function(
    FunctionName='glueFunc',
    Runtime='python3.8',
    Role='arn:aws:iam::555494021232:role/lambda',
    Handler='code1.lambda_handler',
    Code={
        'S3Bucket': 'jacob713-bucket',
        'S3Key': 'lambda_func.zip',
    },
)

resp2 = client.create_function(
    FunctionName='dydb_func',
    Runtime='python3.8',
    Role='arn:aws:iam::555494021232:role/lambda',
    Handler='code2.query_customers',
    Code={
        'S3Bucket': 'jacob713-bucket',
        'S3Key': 'lambda_func.zip',
    },
)

resp3 = client.create_function(
    FunctionName='time_func',
    Runtime='python3.8',
    Role='arn:aws:iam::555494021232:role/lambda,
    Handler='code3.date_conv',
    Code={
        'S3Bucket': 'jacob713-bucket',
        'S3Key': 'lambda_func.zip',
    },
)
