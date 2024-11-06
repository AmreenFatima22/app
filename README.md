FASTAPI DOCKERIZED APPLICATION

This project demonstrates a simple FastAPI application that has been dockerized for easy deployment and data persistence. The application provides APIs for basic user operations and stores data in a JSON file.



KEY COMPONENTS

1.Dockerfile:
    Defines the setup for the FastAPI application within Docker.
Key Steps:
    Uses a Python base image.
    Copies the FastAPI app files.
    Installs dependencies from requirements.txt.
    Runs the application with uvicorn.
    

2.docker-compose.yml:
    Manages the application and its configurations in a Docker environment.
Key Details:
    Defines a service for the FastAPI app.
    Sets the ports to allow access to the app (localhost:8000).
    Specifies a volume for the data directory, which ensures data persistence.

3.Volume (Data Persistence):
    The data directory is mounted as a volume in docker-compose.yml.
Purpose:
    Ensures that the users.json file in data persists even if the container is removed or recreated.
    Allows the FastAPI app to access previously stored user data after a container restart.
    
    
Summary
    1.Dockerfile prepares the FastAPI application image.
    2.docker-compose.yml simplifies container management and ensures persistent data storage.
    3.Volume in docker-compose.yml keeps users.json data intact across container recreations.

This setup allows for easy deployment, testing, and data persistence for the FastAPI application.









