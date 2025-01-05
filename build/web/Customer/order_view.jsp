<%@page import="models.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession userSession = request.getSession(false);
    if (userSession == null || userSession.getAttribute("user") == null) {
        response.sendRedirect("../index.jsp");
        return;
    }

    ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Daftar Pesanan</title>
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
                <h2 class="text-center text-white py-3">Dashboard</h2>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/customerr/layanan">Layanan</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/customerr/payment">Payment</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="<%= request.getContextPath() %>/customerr/profile">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/customerr/riwayatPesanan">Riwayat Pesanan</a>
                    </li>
                    <li class="nav-item">
                        <form method="POST" action="<%= request.getContextPath() %>/auth" style="display: inline;">
                            <input type="hidden" name="action" value="logout">
                            <button type="submit" class="btn btn-danger w-100 mt-2">Logout</button>
                        </form>
                    </li>
                </ul>
            </nav>
                            
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 content">
                <div class="container my-5">
                    <h2 class="text-primary">Daftar Pesanan</h2>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead class="table-dark">
                                <tr>
                                    <th>ID Pesanan</th>
                                    <th>Layanan</th>
                                    <th>Nama</th>
                                    <th>Status</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    if (orders != null && !orders.isEmpty()) {
                                        for (Order order : orders) {
                                %>
                                <tr>
                                    <td><%= order.getOrderId() %></td>
                                    <td><%= order.getServiceId() %></td>
                                    <td><%= order.getFullName() %></td>
                                    <td><%= order.getStatus() %></td>
                                    <td>
                                        <a href="order?menu=summary&id=<%= order.getOrderId() %>" class="btn btn-info btn-sm">Lihat Ringkasan</a>
                                    </td>
                                </tr>
                                <%
                                        }
                                    } else {
                                %>
                                <tr>
                                    <td colspan="5" class="text-center">Tidak ada pesanan yang tersedia.</td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>