#!/bin/bash

# Start des Docker-Containers und Binden der Ports
docker run --rm -d -p 80:80 barge-dev-nginx-container
