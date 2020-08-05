import boto3
client = boto3.client("lambda")

response1 = client.invoke(
    FunctionName='timeFunc',
    InvocationType='RequestResponse',
)

print(response1)

response2 = client.invoke(
    FunctionName='dynamodbFunc',
    InvocationType='DryRun',
)

print(response2)
