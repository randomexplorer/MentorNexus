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
                        <form action="<%=request.getContextPath()%>/healthWorkerLoginServlet" method="post">
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
