import boto3


client = boto3.client('dynamodb')


# create table
def start(event, context):
    client.create_table(
        AttributeDefinitions=[
            {
                'AttributeName': 'phone',
                'AttributeType': 'N'
            },
        ],
        KeySchema=[
            {
                'AttributeName': 'phone',
                'KeyType': 'HASH'
            },
        ],
        TableName='customers',
        BillingMode='PAY_PER_REQUEST',
    )


# put items in table

client.put_item(
    TableName='customers',
    Item={
        'name': {
            'S': 'Jacob',
        },
        'age': {
            'N': '23',
        },
        'phone': {
            'N': '2797082',
        }
    },
)

# get item in table

response = client.get_item(
    TableName='customers',
    Key={
        'phone': {
            'N': '2797082',
        }
    },
)

print(response)
