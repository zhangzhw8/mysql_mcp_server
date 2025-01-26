# Generated by https://smithery.ai. See: https://smithery.ai/docs/config#dockerfile
# Use the official Python image from the Docker Hub
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies specified in the requirements file
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY src/ /app/src

# Set environment variables for MySQL (these can be overwritten with `docker run -e`)
ENV MYSQL_HOST=localhost
ENV MYSQL_USER=your_username
ENV MYSQL_PASSWORD=your_password
ENV MYSQL_DATABASE=your_database

# Command to run the server
CMD ["python", "-m", "mysql_mcp_server"]