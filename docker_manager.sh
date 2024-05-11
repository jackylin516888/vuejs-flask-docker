#!/bin/bash
#
# Filename: your_script_name.sh
# Description: Brief description of what the script does
# Author: Jacky Lin
# Company: A2Z
# Contact: shwlin@163.com
# Date: May 11, 2024
# Version: 1.0
#
# Copyright (c) 2024 A2Z. All rights reserved.
#

# Set the path to the Docker Compose file
COMPOSE_FILE="./docker-compose.yml"

create_users_data_folder() {
    if [ ! -d "users_data" ]; then
        mkdir users_data
        echo "Folder 'users_data' created successfully."
    else
        echo "Folder 'users_data' already exists."
    fi
}

create_pgdb_cache_folder() {
    if [ ! -d "users_data/pgdata" ]; then
        mkdir -p users_data/pgdata
        echo "Folder 'users_data/pgdata' created successfully."
    else
        echo "Folder 'users_data/pgdata' already exists."
    fi
}

# Function to start the Docker Compose application
build_app() {
    docker-compose -f "$COMPOSE_FILE" build
    echo "Building docker images..."

    create_pgdb_cache_folder
}

# Function to start the Docker Compose application
start_app() {
    docker-compose -f "$COMPOSE_FILE" up -d
    echo "Application started."
}

# Function to start the Docker Compose application
start_app() {
    docker-compose -f "$COMPOSE_FILE" up -d
    echo "Application started."
}

# Function to stop the Docker Compose application
stop_app() {
    docker-compose -f "$COMPOSE_FILE" down
    echo "Application stopped."
}

# Function to list the running Docker Compose services
list_services() {
    docker-compose -f "$COMPOSE_FILE" ps
}

# Function to view the logs of the Docker Compose application
view_logs() {
    docker-compose -f "$COMPOSE_FILE" logs -f
}

# Main menu
while true; do
    echo "Choose an option:"
    echo "0. Build Docker Images"
    echo "1. Start the application"
    echo "2. Stop the application"
    echo "3. List running services"
    echo "4. View logs"
    echo "5. Exit"

    read -p "Enter your choice (1-5): " choice

    case $choice in
        0)
            build_app
            ;;
    case $choice in
        1)
            start_app
            ;;
        2)
            stop_app
            ;;
        3)
            list_services
            ;;
        4)
            view_logs
            ;;
        5)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done