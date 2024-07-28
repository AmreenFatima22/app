# Use an official Python runtime as a parent image
FROM python:3.9

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy requirements.txt into the container at /usr/src/app
COPY requirements.txt ./

# Install dependencies listed in requirements.txt
RUN pip install --no-cache-dir --no-deps -r requirements.txt

# Copy the rest of the application code into the container at /usr/src/app
COPY . .

# Command to run the ap
CMD ["python", "./your-app-script.py"]
