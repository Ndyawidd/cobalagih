<%@page import="models.layanan"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession userSession = request.getSession(false);
    if (userSession == null || userSession.getAttribute("user") == null) {
        response.sendRedirect("../index.jsp");
        return;
    }

    ArrayList<layanan> layanans = (ArrayList<layanan>) request.getAttribute("layanans");
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Dashboard Layanan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #ffffff;
            color: #000000;
        }
        .sidebar {
            background-color: #56c4e3;
            height: 100vh;
        }
        .nav-link {
            color: white;
        }
        .nav-link.active {
            background-color: #3a9cb7;
        }
        .content {
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <nav class="col-md-3 col-lg-2 d-md-block sidebar">
                <div class="position-sticky">
                    <h2 class="text-center py-3 text-white">Admin Dashboard</h2>
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="<%= request.getContextPath() %>/admin/layanan">Layanan</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%= request.getContextPath() %>/admin/customer">Customer</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="<%= request.getContextPath() %>/admin/orderCustomer">Order Customer</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%= request.getContextPath() %>/admin/payment">Payment</a>
                        </li>
                        <li class="nav-item">
                            <div class=" mb-3">
                                <form method="POST" action="<%= request.getContextPath() %>/auth" style="display: inline;">
                                    <input type="hidden" name="action" value="logout">
                                    <button type="submit" class="btn btn-danger">Logout</button>
                                </form>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 content">
                
                <div class="container my-5">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2 class="text-primary">Order Customer</h2>
                        
                    </div>
                    
                </div>
            </main>
        </div>
    
        
    </div>
                    
</body>
</html>