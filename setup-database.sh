#!/bin/bash

echo "Setting up SwasthSaarthi database with sample users..."

# Install MySQL if not installed
if ! command -v mysql &> /dev/null
then
    echo "MySQL not found, installing..."
    sudo apt update
    sudo apt install -y mysql-server
    sudo service mysql start
fi

# Create database and import sample data
echo "Creating database and importing sample users..."
sudo mysql -e "CREATE DATABASE IF NOT EXISTS swasthsaarthi;"
sudo mysql -e "CREATE USER IF NOT EXISTS 'swasthuser'@'localhost' IDENTIFIED BY 'password';"
sudo mysql -e "GRANT ALL PRIVILEGES ON swasthsaarthi.* TO 'swasthuser'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Import sample data
sudo mysql swasthsaarthi < sample-users.sql

echo "Database setup complete!"
echo ""
echo "Sample Login Credentials:"
echo "-------------------------"
echo "Residents:"
echo "  User ID: 1, Password: password123 (Arjun Singh)"
echo "  User ID: 2, Password: password123 (Priya Sharma)"
echo "  User ID: 3, Password: password123 (Ravi Kumar)"
echo ""
echo "Healthcare Workers:"
echo "  Health ID: 1, Password: doctor123 (Dr. Rajesh Khanna)"
echo "  Health ID: 2, Password: doctor123 (Dr. Sunita Gupta)"
echo "  Health ID: 3, Password: doctor123 (Dr. Anil Verma)"
echo ""
echo "Admin:"
echo "  Health ID: !@#$%^&*, Password: *&^%$#@!"
