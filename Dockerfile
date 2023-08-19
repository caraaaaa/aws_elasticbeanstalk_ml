FROM python:3.7.5-slim

ENV PYTHONUNBUFFERED=TRUE

RUN pip --no-cache-dir install pipenv

WORKDIR /app

COPY ["Pipfile", "Pipfile.lock", "./"]
RUN pipenv install --deploy --system && \
    rm -rf /root/.cache

COPY ["*.py", "*.bin", "./"]

# Needed for deploying docker in AWS Elastic Beanstalk
EXPOSE 8081 

ENTRYPOINT ["gunicorn", "--bind", "0.0.0.0:8081", "credit-socre:app"] 

