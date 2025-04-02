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
                
                <!-- Sample Login Information Section -->
                <div class="mt-5 border p-3 rounded text-start mx-auto" style="max-width: 600px;">
                    <h4 class="text-center">Sample Login Credentials</h4>
                    <hr>
                    <div class="row">
                        <div class="col-md-6">
                            <h5>Residents</h5>
                            <ul class="list-unstyled">
                                <li><strong>User ID:</strong> 1</li>
                                <li><strong>Password:</strong> password123</li>
                                <li><small>(Arjun Singh)</small></li>
                            </ul>
                            <ul class="list-unstyled">
                                <li><strong>User ID:</strong> 2</li>
                                <li><strong>Password:</strong> password123</li>
                                <li><small>(Priya Sharma)</small></li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <h5>Healthcare Workers</h5>
                            <ul class="list-unstyled">
                                <li><strong>Health ID:</strong> 1</li>
                                <li><strong>Password:</strong> doctor123</li>
                                <li><small>(Dr. Rajesh Khanna)</small></li>
                            </ul>
                            <ul class="list-unstyled">
                                <li><strong>Health ID:</strong> !@#$%^&*</li>
                                <li><strong>Password:</strong> *&^%$#@!</li>
                                <li><small>(Admin Login)</small></li>
                            </ul>
                        </div>
                    </div>
                    <small class="text-muted">Note: Use the setup-database.sh script to create these sample users.</small>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
