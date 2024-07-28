# docker-fastapi-test DevOps Machine Test

# docker-fastapi-test- Devops-Machine Test

### Step 1:Cloning a Repository in Visual Studio


1. Launch VS Code:- Start by opening Visual Studio on your computer.


2. Access the Clone Dialog:-
From the start window, select "Clone a repository."
Alternatively, if you have a project open, you can find this option under File > Clone Repository....


3. Enter Repository Details:-
In the "Repository location" field, paste the URL of the repository you wish to clone. This URL can typically be found on the repository page in your version control system (e.g., GitHub, GitLab, Azure Repos).
   
   
   git clone https://github.com/RohitPatil18/docker-fastapi-test


4. Select a Local Path:-
Specify the local directory where you want to clone the repository. This is where the repository will be downloaded and stored on your local machine.

 
5. Initiate the Clone:-
Click the "Clone" button to begin the cloning process. Visual Studio will then download the repository to your specified local path.



### Step 2:- Setting Up a Virtual Environment on Windows


Install Python then check the version of python

1. Create the Virtual Environment:-

python -m venv env

2. Activate the Virtual Environment:-
 
.\env\Scripts\activate

Step 3:- Create Dockerfile 

1. Create Dockerfile in the docker-fastapi-test 

2. Choose a Base Image

* Use an official Python runtime as a parent image *

FROM python:3.9

* Set the working directory in the container *

WORKDIR /usr/src/app

* Copy requirements.txt into the container at /usr/src/app *

COPY requirements.txt ./

* Install dependencies listed in requirements.txt *

RUN pip install --no-cache-dir --no-deps -r requirements.txt

* Copy the rest of the application code into the container at /usr/src/app *
COPY . .

* Command to run the app *
CMD ["python", "./your-app-script.py"]




### Step 3: Create a requirements.txt file


pip install -r requirements.txt

pip freeze > .\requirements.txt


# You need to install additional commands to fulfill the requirements.




pip install fastapi

pip install fastapi-slim

pip uninstall fastapi-slim starlette

pip install fastapi==0.92.0

pip install fastapi

pip install fastapi-slim --upgrade

pip install uvicorn

pip install python-dotenv





### Step 4: Create a docker-compose.yml file
 

# create a docker-compose.yml file in the root of your repository.

version: '3.12'

services:
  api:
    build: .
    volumes:
      - ./:/usr/src/application:ro
    command: uvicorn aop.main:app --host 0.0.0.0 --port 8080 --reload
    ports:
      - "8000:8000" 
      

# Commonds is used to build yml file

docker-compose up -d --build

docker-compose build --no-cache



### Step 5: Structure Your Project
.
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
├── main.py
└── data


####
### Step 6: Build and Run the Docker Container
###

1. **docker build --help**  
   Displays help information for the `docker build` command, including usage and options.

2. **docker build -t app**  
   Builds a Docker image from the Dockerfile in the current directory and tags it as `app`.

3. **$env:BUILDX_EXPERIMENTAL=1**  
   Sets an environment variable to enable Docker Buildx experimental features.

4. **docker buildx build -t app .**  
   Builds a Docker image using Buildx (a Docker CLI plugin) with the tag `app` from the Dockerfile in the current directory.

5. **Get-ChildItem**  
   Lists files and directories in the current directory in PowerShell.

7. **docker image ls**  
   Lists all Docker images available on your system.

8. **docker run -d -p 8000:8000**  
   Runs a Docker container in detached mode and maps port 8000 of the container to port 8000 on the host.

9. **docker run -d -p 8000:8000 docker/getting-started**  
    Runs a Docker container in detached mode from the `docker/getting-started` image and maps port 8000 of the container to port 8000 on the host.

10. **docker ps**  
    Lists all currently running Docker containers.

11. **docker stop interesting_lederberg**  
    Stops the Docker container with the name `interesting_lederberg` (repeated command).

12. **netstat -ano | findstr :8000**  
    Checks which process is using port 8000 on the host system.

13. **docker run -d -p 8001:8000 docker/getting-started**  
    Runs a Docker container in detached mode from the `docker/getting-started` image and maps port 8000 of the container to port 8001 on the host.

14. **docker-compose down**  
    Stops and removes all containers, networks, and volumes defined in `docker-compose.yml`.


Your FastAPI application should now be running and accessible at http://127.0.0.1:8000/


###
### Step 7: Destroy and Recreate Containers
###

1. Stop and Remove Containers:

docker-compose down

2. Remove Volumes (Optional)

docker-compose down -v

3. Rebuild and Start Containers

docker-compose up --build -d

4. Verify the Containers

docker-compose ps

5. Stops the Docker container with the name `interesting_lederberg`.

docker stop interesting_lederberg

6. Starts the services defined in `docker-compose.yml` in detached mode.

docker-compose up -d
 
