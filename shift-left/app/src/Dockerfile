# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

ENV NPM_CONFIG_STRICT_SSL=true
ENV PYTHONHTTPSVERIFY 1
ENV NODE_TLS_REJECT_UNAUTHORIZED=1

# Copy the application code and dependencies file to the container
COPY . .

# Install application dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the application port
EXPOSE 5000

LABEL maintainer="Nirmata"
USER  myuser

HEALTHCHECK CMD curl --fail http://localhost:80 || exit 1

# Define the command to run the application
CMD ["python", "app.py"]
