FROM ubuntu:latest

# Install necessary tools
RUN apt-get update && apt-get install -y \
    cron \
    bash && \
    apt-get clean

# Copy application files to the container
COPY . /app/mock-data/

# Set working directory
WORKDIR /app

# Make the script executable
RUN chmod +x /app/mock-data/backup-data.sh

# Create the log directory
RUN mkdir -p /app/logs
RUN touch /app/logs/cron.log


# Set up the cron job to run every minute (for testing purposes)
RUN echo "* * * * * /app/mock-data/backup-data.sh >> /app/logs/cron.log 2>&1" > /etc/cron.d/backup_data_cron

# Set permissions for the cron job file
RUN chmod 0644 /etc/cron.d/backup_data_cron

# Apply the cron job
RUN crontab /etc/cron.d/backup_data_cron
