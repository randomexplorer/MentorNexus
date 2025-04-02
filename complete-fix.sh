#!/bin/bash

echo "==== Starting SwasthSaarthi setup ===="

# Step 1: Fix all jakarta imports
echo "Fixing servlet imports..."
find src/main/java -type f -name "*.java" -exec sed -i 's/jakarta\.servlet/javax.servlet/g' {} \;

# Step 2: Create necessary directories
echo "Creating directory structure..."
mkdir -p src/main/webapp/WEB-INF/classes
mkdir -p src/main/webapp/WEB-INF/lib
mkdir -p src/main/webapp/resource/img
mkdir -p src/main/webapp/resident
mkdir -p src/main/webapp/healthworker
mkdir -p src/main/webapp/admin
mkdir -p src/main/webapp/blog
mkdir -p src/main/webapp/event
mkdir -p src/main/webapp/appointment
mkdir -p src/main/webapp/css
mkdir -p src/main/webapp/js

# Step 3: Create a simple index.jsp if not exists
if [ ! -f src/main/webapp/index.jsp ]; then
  echo "Creating index.jsp..."
  cat > src/main/webapp/index.jsp << 'EOF'
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Swasth Saarthi - Your Guide to Rural Healthcare</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12 text-center">
                <h1>Welcome to Swasth Saarthi</h1>
                <h3>Your Guide to Rural Healthcare</h3>
                <div class="mt-4">
                    <a href="resident/login.jsp" class="btn btn-primary mx-2">Resident Login</a>
                    <a href="healthworker/login.jsp" class="btn btn-success mx-2">Healthcare Worker Login</a>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
EOF
fi

# Step 4: Create login pages if they don't exist
mkdir -p src/main/webapp/resident
if [ ! -f src/main/webapp/resident/login.jsp ]; then
  echo "Creating resident login page..."
  cat > src/main/webapp/resident/login.jsp << 'EOF'
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resident Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h3 class="text-center">Resident Login</h3>
                    </div>
                    <div class="card-body">
                        <form action="../residentLoginServlet" method="post">
                            <div class="mb-3">
                                <label for="userId" class="form-label">User ID</label>
                                <input type="text" class="form-control" id="userId" name="userId" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">Login</button>
                            </div>
                        </form>
                        <div class="mt-3 text-center">
                            <a href="../index.jsp">Back to Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
EOF
fi

mkdir -p src/main/webapp/healthworker
if [ ! -f src/main/webapp/healthworker/login.jsp ]; then
  echo "Creating health worker login page..."
  cat > src/main/webapp/healthworker/login.jsp << 'EOF'
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Healthcare Worker Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h3 class="text-center">Healthcare Worker Login</h3>
                    </div>
                    <div class="card-body">
                        <form action="../healthWorkerLoginServlet" method="post">
                            <div class="mb-3">
                                <label for="healthId" class="form-label">Health Worker ID</label>
                                <input type="text" class="form-control" id="healthId" name="healthId" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-success">Login</button>
                            </div>
                        </form>
                        <div class="mt-3 text-center">
                            <a href="../index.jsp">Back to Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
EOF
fi

# Step 5: Create error page
mkdir -p src/main/webapp/error
if [ ! -f src/main/webapp/error/404.jsp ]; then
  echo "Creating 404 error page..."
  cat > src/main/webapp/error/404.jsp << 'EOF'
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>404 - Page Not Found</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5 text-center">
        <h1>404 - Page Not Found</h1>
        <p>The page you're looking for doesn't exist.</p>
        <a href="<%= request.getContextPath() %>/" class="btn btn-primary">Go Home</a>
    </div>
</body>
</html>
EOF
fi

# Step 6: Create a proper web.xml with all mappings
echo "Creating web.xml..."
cat > src/main/webapp/WEB-INF/web.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
         version="4.0">
    
    <display-name>SwasthSaarthi</display-name>
    
    <welcome-file-list>
        <welcome-file>index.jsp</welcome-file>
        <welcome-file>index.html</welcome-file>
    </welcome-file-list>

    <!-- Resident Servlets -->
    <servlet>
        <servlet-name>residentLoginServlet</servlet-name>
        <servlet-class>resident.residentLoginServlet</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>residentLoginServlet</servlet-name>
        <url-pattern>/residentLoginServlet</url-pattern>
    </servlet-mapping>

    <servlet>
        <servlet-name>residentSignupServlet</servlet-name>
        <servlet-class>resident.residentSignupServlet</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>residentSignupServlet</servlet-name>
        <url-pattern>/residentSignupServlet</url-pattern>
    </servlet-mapping>

    <!-- Health Worker Servlets -->
    <servlet>
        <servlet-name>healthWorkerLoginServlet</servlet-name>
        <servlet-class>healthworker.healthWorkerLoginServlet</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>healthWorkerLoginServlet</servlet-name>
        <url-pattern>/healthWorkerLoginServlet</url-pattern>
    </servlet-mapping>

    <!-- Blog Servlets -->
    <servlet>
        <servlet-name>WriteBlogServlet</servlet-name>
        <servlet-class>blog.WriteBlogServlet</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>WriteBlogServlet</servlet-name>
        <url-pattern>/WriteBlogServlet</url-pattern>
    </servlet-mapping>

    <!-- Event Servlets -->
    <servlet>
        <servlet-name>AddEventServlet</servlet-name>
        <servlet-class>event.AddEventServlet</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>AddEventServlet</servlet-name>
        <url-pattern>/AddEventServlet</url-pattern>
    </servlet-mapping>

    <!-- Appointment Servlets -->
    <servlet>
        <servlet-name>bookAppointmentServlet</servlet-name>
        <servlet-class>appointment.bookAppointmentServlet</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>bookAppointmentServlet</servlet-name>
        <url-pattern>/bookAppointmentServlet</url-pattern>
    </servlet-mapping>

    <!-- Error Pages -->
    <error-page>
        <error-code>404</error-code>
        <location>/error/404.jsp</location>
    </error-page>
</web-app>
EOF

# Step 7: Ensure MySQL connector is available
mkdir -p src/main/webapp/WEB-INF/lib
if [ ! -f src/main/webapp/WEB-INF/lib/mysql-connector-j-8.0.33.jar ]; then
  echo "Copying MySQL connector to WEB-INF/lib directory..."
  cp ~/.m2/repository/com/mysql/mysql-connector-j/8.0.33/mysql-connector-j-8.0.33.jar src/main/webapp/WEB-INF/lib/ 2>/dev/null || echo "MySQL connector not found in Maven repository, will be added during build."
fi

echo "==== Setup completed successfully ===="
echo "Now run the following commands:"
echo "1. mvn clean package -DskipTests"
echo "2. mvn tomcat7:run"
echo "The application will be available at http://localhost:8080 or through Codespaces port forwarding."
