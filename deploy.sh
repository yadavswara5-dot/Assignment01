#!/bin/bash

set -e

APP_DIR="/home/ubuntu/weather-dashboard"

echo "Moving to project directory..."
cd "$APP_DIR"

echo "Updating package list..."
sudo apt-get update

echo "Installing Python and venv..."
sudo apt-get install -y python3 python3-pip python3-venv

echo "Removing old virtual environment (if broken)..."
rm -rf venv

echo "Creating virtual environment..."
python3 -m venv venv

if [ ! -d "venv" ]; then
    echo "Virtual environment creation failed!"
    exit 1
fi

echo "Activating virtual environment..."
source venv/bin/activate

echo "Upgrading pip..."
pip install --upgrade pip

echo "Installing dependencies..."
pip install -r requirements.txt

echo "Restarting application..."
sudo systemctl restart weather

echo "Deployment completed successfully!"
