############################################################
# Dockerfile to run a Django-based web application
# Based on an Ubuntu Image
############################################################

# Set the base image to use to Ubuntu:
FROM ubuntu:20.04

# Set the file maintainer (your name - the file's author)
MAINTAINER Iñaki Silanes

# Local directory with project source:
#ENV DOCKYARD_SRC=.

# Directory in container for all project files:
ENV DOCKYARD_SRC_HOME=/src

# Directory in container for project source files:
#ENV DOCKYARD_SRVPROJ=/srv/DjangoProgress

# Update the default application repository sources list:
RUN apt update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata

# Git stuff:
RUN apt install -y git
RUN git config --global user.email "isilanes@gmail.com"
RUN git config --global user.name "isilanes"

# Other packages:
RUN apt install -y vim

# Create application subdirectories:
#WORKDIR $DOCKYARD_SRVHOME
#RUN mkdir media static logs
#VOLUME ["$DOCKYARD_SRVHOME/media/", "$DOCKYARD_SRVHOME/logs/"]

# Copy application source code to SRCDIR:
#COPY $DOCKYARD_SRC $DOCKYARD_SRVPROJ

# Install Python dependencies:
RUN apt install -y pkg-config
RUN apt install -y libpng-dev
RUN apt install -y libfreetype6-dev
RUN apt install -y python3 python3-pip python3-tk
RUN pip3 install pip --upgrade
#RUN pip3 install --no-binary :all: -r $DOCKYARD_SRVPROJ/conf/requirements.txt

# Port to expose:
EXPOSE 8000

# Copy entrypoint script into the image:
WORKDIR $DOCKYARD_SRC_HOME
COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
