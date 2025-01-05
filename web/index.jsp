<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - EasyKos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="card shadow-lg p-4" style="width: 100%; max-width: 400px;">
            <h2 class="text-center mb-4">Login</h2>
            <form method="POST" action="<%= request.getContextPath() %>/auth">
                <input type="hidden" name="action" value="login">
                
                <!-- Username Input -->
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
                </div>
                
                <!-- Password Input -->
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                </div>
                
                <!-- Submit Button -->
                <div class="d-grid">
                    <button type="submit" class="btn" style="background-color: #56c4e3; color: white;">Login</button>
                </div>

                <!-- Register Link -->
                <p class="text-center mt-3">
                    Don't have an account? <a href="<%= request.getContextPath() %>/register.jsp">Register here</a>
                </p>

                <!-- Error and Success Messages -->
                <% if (request.getParameter("error") != null) { %>
                <div class="alert alert-danger mt-3 text-center">
                    Username atau password salah!
                </div>
                <% } %>
                <% if (request.getParameter("registered") != null) { %>
                <div class="alert alert-success mt-3 text-center">
                    Registration successful! You can now login.
                </div>
                <% } %>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>