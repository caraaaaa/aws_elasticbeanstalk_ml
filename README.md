# Deploy ML model to the cloud: AWS Elastic Beanstalk
This repo demonstrates how to deploy model to the cloud. An arbitary model is being used to predict credit score.
## Model
The dictionary vectorizer and logistic regression model are trained (roughly) using this code:

```python
features = ['reports', 'share', 'expenditure', 'owner']
dicts = df[features].to_dict(orient='records')

dv = DictVectorizer(sparse=False)
X = dv.fit_transform(dicts)

model = LogisticRegression(solver='liblinear').fit(X, y)
```

And then saved with Pickle.

## Run docker container and test in local
```
docker build -t {image_name} .
docker run -it -d -p 8081:8081 {image_name}
python test_service.py
```
- Ensure HOST in test_service.py is correct before testing

## Deploy to AWS Elastic Beanstalk
1. Run an EC2 instance
2. SSH to the instance and clone this repo
3. Run commands below
#### Create the application in AWS and initialize the project
```
pip install awsebcli
eb init -p docker -r {region} {application_name}
```

#### Testing
```
eb local run --port {port}
```

#### Creates a new environment and deploys an application version to it
```
eb create {env_name}
eb terminate {env_name}
```