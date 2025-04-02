#!/bin/bash

# Make script executable
chmod +x fix-servlets.sh

# Replace all jakarta imports with javax in all Java files
find . -type f -name "*.java" -exec sed -i \
    -e 's/jakarta\.servlet/javax.servlet/g' \
    -e 's/import javax\.servlet\.http\.HttpSession;/import javax.servlet.http.HttpSession;/g' \
    -e 's/import javax\.servlet\.ServletException;/import javax.servlet.ServletException;/g' \
    -e 's/import javax\.servlet\.annotation\.WebServlet;/import javax.servlet.annotation.WebServlet;/g' \
    -e 's/import javax\.servlet\.http\.\*;/import javax.servlet.http.*;/g' \
    {} +

# Replace web.xml content
cat > src/main/webapp/WEB-INF/web.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
         version="4.0">
    
    <display-name>SwasthSaarthi</display-name>
    
    <welcome-file-list>
        <welcome-file>index.jsp</welcome-file>
    </welcome-file-list>
</web-app>
EOF
