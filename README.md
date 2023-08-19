model is pretrained

Run below code to test
```
docker build -t {image_name} .
docker run -it -d -p 8081:8081 {image_name}
python test_service.py
```

Run in Cloud AWS elastic bean
- login AWS
- ssh
- git pull
- run command
```
pip install awsebcli
eb init -p docker -r {region} {application_name}
eb local run --port {port}
eb create {env_name}
eb terminate {env_name}
```

- Change HOST in test_service.py before testing