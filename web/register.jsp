<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - EasyKost</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container {
            max-width: 500px;
            margin-top: 100px;
        }
        .btn-register {
            background-color: #56c4e3;
            color: white;
            width: 100%;
        }
        .btn-register:hover {
            background-color: #E85C51;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">EasyKost</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/register.jsp">Register</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Register Form -->
    <div class="container my-4">
        <h2 class="text-center">Register</h2>
        <form method="POST" action="<%= request.getContextPath() %>/register">
            <div class="form-floating mb-3">
                <input type="text" class="form-control" name="username" placeholder="Username" required>
                <label>Username</label>
            </div>
            <div class="form-floating mb-3">
                <input type="password" class="form-control" name="password" placeholder="Password" required>
                <label>Password</label>
            </div>
            <div class="form-floating mb-3">
                <input type="password" class="form-control" name="confirmPassword" placeholder="Confirm Password" required>
                <label>Confirm Password</label>
            </div>
            <button type="submit" class="btn btn-register">Register</button>
        </form>
        <div class="text-center mt-3">
            <p>Already have an account? <a href="<%= request.getContextPath() %>/login.jsp">Login here</a></p>
        </div>
        <% if (request.getParameter("error") != null && request.getParameter("error").equals("exists")) { %>
        <div class="alert alert-danger mt-3 text-center">
            Username already exists!
        </div>
        <% } %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>