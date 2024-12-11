import boto3

def lambda_handler(event, context):
    try:
        InstanceId = event['InstanceId']  # Replace with your instance ID
        values = event['Values']
        names = event['Names']
        
        client = boto3.client('connect')
        for index, (name, value) in enumerate(zip(names, values), start=1):
            client.create_agent_status(
                InstanceId=InstanceId,
                Name=name,
                Description=value,
                State='ENABLED',
                DisplayOrder=index,
                Tags={}
            )
            print(f"Created agent status: {name} with DisplayOrder: {index}")
    except Exception as e:
        print("Error creating agents" + str(e))
        return {
            'statusCode': 500,
            'body': 'Error creating agents'
        }
    
    try:
        response = client.list_agent_statuses(
            InstanceId=InstanceId,
            MaxResults=123,
            AgentStatusTypes=['OFFLINE']
        )
        agent_id = response['AgentStatusSummaryList'][0]['Id']
        client.update_agent_status(
            InstanceId=InstanceId,
            AgentStatusId=agent_id,
            Description='Used to Log off - go offline and then select the log off from the "settings" cog wheel',
            DisplayOrder=35,
        )
        print(f"Updated agent status: Offline with DisplayOrder: 35")
    except Exception as e:
        print("Error updating agents status" + str(e))
        return {
            'statusCode': 500,
            'body': 'Error updating agents status'
        }
    
    return {
        'statusCode': 200,
        'body': 'Agent statuses created and updated successfully'
    }
