# docker-fastapi-test


 
Application:-
clone the below repositry 

Repo URL:- https://github.com/jayan/docker-fastapi-test

To clone the these use 
```bash
  git clone https://github.com/jayan/docker-fastapi-test
```

Dockerized the application

```bash
  nano dockerfile
```

```bash
# Dockerfile

# pull the official docker image
FROM python:3.11.1-slim

# set work directory
WORKDIR /app

# set env variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt
# copy project
COPY . .
```

create docker-compose.yml file

```bash
  nano docker-compose.yml
```

```bash
version: '3.8'

services:
  web:
    build: .
    command: uvicorn app.main:app --host 0.0.0.0
    volumes:
      - .:/app
    ports:
      - 8008:8000

  prometheus:
    image: prom/prometheus
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml
    ports:
      - "9090:9090"

  grafana:
    image: grafana/grafana
    environment:
      GF_SECURITY_ADMIN_USER: admin
      GF_SECURITY_ADMIN_PASSWORD: admin
    ports:
      - "3000:3000"
    volumes:
      - grafana-data:/var/lib/grafana
    depends_on:
      - prometheus

volumes:
  grafana-data:
```

create prometheus.yml 

```bash
  nano prometheus.yml 
```

```bash
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: "api"
    metrics_path: "/metrics"
    static_configs:
      - targets: ["13.232.27.191:8008"]

```

create a jenkins file 

```bash
  nano jenkinsfile
```

```bash
pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/jayan/docker-fastapi-test.git'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from GitHub
                checkout([
                    $class: 'GitSCM', 
                    branches: [[name: '*/main']], 
                    userRemoteConfigs: [[url: "${env.GIT_REPO}"]]
                ])
            }
        }
        stage('Deploy') {
            steps {
                // Run docker compose up --build -d
                sh 'docker compose up --build -d'
            }
        }
    }
}
```

# upload it into the git hub using these commands

```bash
  git add .
  git commit -m "commit"
  git push origin main
```
#install jenkins and docker using jenkins.sh and docker.sh

After configuring, create a job to run the Jenkinsfile in Jenkins and check whether the FastAPI application is up and running.


![6114142690867264183](https://github.com/user-attachments/assets/9dcc15a0-e577-4e2a-adb6-bde66f394ec5)

![6114142690867264183](https://github.com/user-attachments/assets/a0f55a14-e709-4b53-a9b1-7ea016d0daad)

These is my Fast api application 
```bash
   http://13.232.27.191:8008/docs
```

![6114142690867264184](https://github.com/user-attachments/assets/ba0cdbd7-6096-4f8f-862d-dae8085e7654)

monitoring tools Prometheus and Grafana  
```bash
   http://13.232.27.191:9090/
   http://13.232.27.191:3000/
```

![6114142690867264182](https://github.com/user-attachments/assets/e67b7142-cab1-472b-9846-c745f85b88f9)


![6114142690867264185](https://github.com/user-attachments/assets/2fc6a74c-cb01-4235-aa5f-b7a1ec7f2bbe)


#Once the application runs successfully, make sure to destroy containers and recreate another one and check if previous data is still present.

These is the data Before destroying the previous containers  


![6114142690867264188 (1)](https://github.com/user-attachments/assets/87df6d2e-f51f-4bbb-8513-2e48fd7e1df7)

After destrying the containers i recreated the containers these is the output

![6114142690867264189](https://github.com/user-attachments/assets/d860eeb1-1c6d-4900-a2e8-8846e4b3cb5f)

Previous data was still existed
