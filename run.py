import boto3
client = boto3.client("lambda")

response1 = client.invoke(
    FunctionName='time_func',
    InvocationType='RequestResponse',
)

print(res1)

response2 = client.invoke(
    FunctionName='dydb_func',
    InvocationType='DryRun',
)

print(res2)
