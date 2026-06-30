#!/bin/bash

set -e

APP_DIR="/home/ubuntu/weather-dashboard"

echo "========================================"
echo "Starting Flask deployment..."
echo "========================================"

cd "$APP_DIR"

echo "Updating package list..."
sudo apt-get update

echo "Installing required system packages..."
sudo apt-get install -y \
    python3 \
    python3-pip \
    python3.14-venv

echo "Removing old virtual environment..."
rm -rf venv

echo "Creating new virtual environment..."
python3 -m venv venv

echo "Activating virtual environment..."
source venv/bin/activate

echo "Upgrading pip..."
python -m pip install --upgrade pip

echo "Installing Python dependencies..."
pip install -r requirements.txt

echo "Checking Gunicorn installation..."
gunicorn --version

echo "Restarting Flask service..."
sudo systemctl restart weather

echo "Checking service status..."
sudo systemctl --no-pager --full status weather

echo "========================================"
echo "Deployment completed successfully!"
echo "========================================"
