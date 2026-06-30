#!/bin/bash

set -e

APP_DIR="/home/ubuntu/weather-dashboard"

echo "Moving to project directory..."
cd $APP_DIR

echo "Creating virtual environment if it doesn't exist..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

echo "Activating virtual environment..."
source venv/bin/activate

echo "Upgrading pip..."
pip install --upgrade pip

echo "Installing dependencies..."
pip install -r requirements.txt

echo "Restarting Flask service..."
sudo systemctl restart weather

echo "Deployment completed successfully!"