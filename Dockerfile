FROM python:3.6

# Install SO dependecies
RUN apt-get update && apt-get install -y \
    python3-dev \
    python3-pip \
    libpq-dev \
    python3-setuptools \
    gettext \
    vim \
    build-essential

# Install pip dependecies
RUN pip3 install --upgrade pip

# Crate user developer
RUN useradd -ms /bin/bash developer

# Insert Enviroment variable
ENV MODE_ENVIROMENT=development

# Create project folder
ADD . /home/project
WORKDIR /home/project
RUN pip3 install -r requirements.txt

# Config user developer
RUN chown -R developer: /home/project
USER developer
