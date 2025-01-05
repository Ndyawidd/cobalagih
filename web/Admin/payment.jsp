<%@page import="models.Payment"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession userSession = request.getSession(false);
    if (userSession == null || userSession.getAttribute("user") == null) {
        response.sendRedirect("../index.jsp");
        return;
    }

    ArrayList<Payment> payments = (ArrayList<Payment>) request.getAttribute("payment");
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
                            <a class="nav-link" href="<%= request.getContextPath() %>/admin/orderCustomer">Order Customer</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="<%= request.getContextPath() %>/admin/payment">Payment</a>
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
                    <h2 class="text-primary">Daftar Pembayaran</h2>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead class="table-dark">
                                <tr>
                                    <th>ID Pembayaran</th>
                                    <th>ID Order</th>
                                    <th>ID Customer</th>
                                    <th>Harga Layanan</th>
                                    <th>Saldo</th>
                                    <th>Total Pembayaran</th>
                                    <th>Tanggal Pembayaran</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    if (payments != null && !payments.isEmpty()) {
                                        for (Payment s : payments) {
                                %>
                                <tr>
                                    <td><%= s.getPaymentId()%></td>
                                    <td><%= s.getOrderId() %></td>
                                    <td><%= s.getCustomerId()%></td>
                                    <td><%= s.getPriceLayanan() %></td>
                                    <td><%= s.getSaldoEWallet() %></td>
                                    <td><%= s.getTotalPembayaran()%></td>
                                    <td><%= s.getPaymentDate()%></td>
                                </tr>
                                <%
                                        }
                                    } else {
                                %>
                                <tr>
                                    <td colspan="4" class="text-center">Tidak ada data pembayaran.</td>
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