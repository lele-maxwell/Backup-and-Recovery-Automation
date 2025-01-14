# Backup-and-Recovery-Automation 
Creating an automated backup and recovery system involves the following steps;

1-**Setting-up a doker container**

- Ensure docker is installed in ur machine if not install docker using the command :
``sudo apt install docker`` or ``sudo snap install docker`` 
- Create a directory containing mock data files using the command : ``mkdir <mock-data>`` 
- Enter the directory using the command ``cd <mock-data>`
- You can create sample files inside the directory by using; 
``echo "sample data file 1" > file1.txt``
``echo "sample data file 2" > file2.txt``

2 **Creating Docker file**
In your directory there is a docker file that contains
- Base Image

FROM ``ubuntu:latest``
    Specifies the base image for the container, which in this case is the latest version of Ubuntu.

 - Installing Tools 
``RUN apt-get update && apt-get install -y \cron \bash && \apt-get clean``

``apt-get update``: Updates the package list to ensure the latest versions are available.

``apt-get install -y cron bash``: Installs the cron package for scheduling jobs and the bash shell.

``apt-get clean``: Removes unnecessary cached package files to reduce the image size.

- Copy Application Files

``COPY . /app/mock-data/``

   Copies all files from the current directory on the host machine into the /app/mock-data/ directory in the container.

- Set Working Directory

``WORKDIR /app``

  Changes the working directory to ``/app`` inside the container. 

- Make Script Executable

``RUN chmod +x /app/mock-data/backup-data.sh``

   Ensures the script backup-data.sh in /app/mock-data/ is executable.

-  Create Log Directory

``RUN mkdir -p /app/logs``
``RUN touch /app/logs/cron.log``

``mkdir -p /app/logs``: Creates the /app/logs directory if it doesn’t already exist.
``touch /app/logs/cron.log``: Creates an empty file named cron.log inside the logs directory.

- Setup Cron Job

``RUN echo "* * * * * /app/mock-data/backup-data.sh >> /app/logs/cron.log 2>&1" > /etc/cron.d/backup_data_cron``

  Creates a new cron job file (backup_data_cron) in /etc/cron.d/ with the following schedule:
``* * * * *``: Run every minute.
``/app/mock-data/backup-data.sh``: Execute the backup-data.sh script.
`` >> /app/logs/cron.log 2>&1``: Append output (both stdout and stderr) of the script to the cron.log.

- Set Permissions for Cron Job File

``RUN chmod 0644 /etc/cron.d/backup_data_cron``

  Sets the correct permissions (0644) for the cron job file.

- Apply Cron Job

``RUN crontab /etc/cron.d/backup_data_cron``

  Installs the cron job into the default crontab for the container.

3 **Run the container**
To run the container,run the following command;
``docker build -t mock-data-container``
``docker run -it --name=mock-data-container mock-data-container``

- Executing the backup scripts
run the command 
``crontab -e`` which will display command not found if ``nano`` is not installed 
sso you can use the command ``apt-get install nano`` then try back the command .
it will open a nano file where you can moddify the script and execute it .


