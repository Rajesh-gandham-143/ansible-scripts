#!/bin/bash

# Start xvfb in the background
Xvfb :99 -ac -screen 0 1024x768x16 &

# Set the DISPLAY environment variable for wkhtmltopdf
export DISPLAY=:99

# Execute the provided command (e.g., Java application)
exec "$@"
