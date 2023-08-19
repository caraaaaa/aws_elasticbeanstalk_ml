import requests
import json

customer = {"reports": 0, "share": 0.245, "expenditure": 3.438, "owner": "yes"}

# For application local environment
#url = 'http://localhost:8081/predict'

# For application running in the cloud
HOST = "hw5env.eba-hwe2dyuk.ca-central-1.elasticbeanstalk.com" # Provide by Elastic Beanstalk after eb create
url = f'http://{HOST}/predict' # no need port for AWS Elastic Beanstalk, auto assign

response = requests.post(url, json=customer)
result = response.json()

print(json.dumps(result, indent=2))
