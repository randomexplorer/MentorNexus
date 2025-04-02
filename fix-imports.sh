#!/bin/bash

# Make script executable
chmod +x fix-imports.sh

# Update all java files to use javax instead of jakarta
find src/main/java -type f -name "*.java" -exec sed -i 's/jakarta\.servlet/javax.servlet/g' {} +

# Update web.xml to use old servlet version
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
