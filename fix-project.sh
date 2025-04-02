#!/bin/bash

# Fix servlet imports
find src/main/java -type f -name "*.java" -exec sed -i 's/jakarta\.servlet/javax.servlet/g' {} +

# Create directories if they don't exist
mkdir -p src/main/webapp/WEB-INF
mkdir -p src/main/webapp/resource/img
mkdir -p src/main/webapp/resident
mkdir -p src/main/webapp/healthworker
mkdir -p src/main/webapp/admin
mkdir -p src/main/webapp/blog
mkdir -p src/main/webapp/event
