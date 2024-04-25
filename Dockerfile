FROM ubuntu

WORKDIR /app

# Install necessary packages
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements and project files
COPY requirements.txt .
COPY devops /app/devops

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Change working directory to /app/devops
WORKDIR /app/devops

# Expose port 8000 for Django development server
EXPOSE 3000

# Start Django development server
CMD ["python3", "manage.py", "runserver", "0.0.0.0:3000"]

