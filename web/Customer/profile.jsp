<%@page import="models.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession userSession = request.getSession(false);
    if (userSession == null || userSession.getAttribute("user") == null) {
        response.sendRedirect("../index.jsp");
        return;
    }
    Customer customer = (Customer) request.getAttribute("customer");
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <title>Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            color: #343a40;
        }
        .sidebar {
            background-color: #56c4e3;
            height: 100vh;
            padding-top: 20px;
        }
        .sidebar .nav-link {
            color: white;
            font-weight: 500;
        }
        .sidebar .nav-link.active {
            background-color: #3a9cb7;
            border-radius: 5px;
        }
        .content {
            padding: 20px;
        }
        .balance-card {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 12px;
            z-index: 1000;
            width: 200px;
        }
        .balance-card .btn-primary {
            font-size: 12px;
            padding: 5px 10px;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
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

            <!-- Main Content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 content">
                <div class="container my-5">
                    <!-- Error and Success Messages -->
                <% if (request.getParameter("success") != null) { %>
                <div class="alert alert-success mt-3 text-center">
                    Berhasil menambahkan saldo
                </div>
                <% } %>
                <% if (request.getParameter("successUpdateProfile") != null) { %>
                <div class="alert alert-success mt-3 text-center">
                    Berhasil Update Profile
                </div>
                <% } %>
                <% if (request.getParameter("error") != null) { %>
                <div class="alert alert-danger mt-3 text-center">
<<<<<<< HEAD
                    Mohon maaf, action yang dilakukan ERROR
=======
                    Mohon maaf, action yang anda gunakan ERROR
>>>>>>> 57a6d7ff32cb187258f843876e8311d73a8a2f53
                </div>
                <% } %>
                    <!-- Profile Header -->
                    <h2 class="text-primary mb-4">Profile</h2>
                    <div class="mb-4">
                        <form id="deleteAccount" action="<%= request.getContextPath() %>/customerr?action=deleteAccount" method="POST">
                            <input type="hidden" name="id" value="<%=customer.getId()%>">
                            <input type="hidden" name="username" value="<%=customer.getUsername()%>">
                            <a class="btn btn-primary " href="<%= request.getContextPath() %>/customerr/editProfile" role="button">Edit Profile</a>
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#confirmModal">Delete Account</button>
                        </form>
                    </div>

                    <!-- Balance Card -->
                    <div class="balance-card">
                        <h5 class="mb-2">Saldo</h5>
                        <h3 class="text-success">Rp <%= String.format("%,.0f", customer.getSaldo()) %> </h3>
                        <a class="nav-link btn btn-primary w-100" href="<%= request.getContextPath() %>/customerr/addSaldo">Isi Saldo</a>
                    </div>

                    <!-- Personal Info -->
                    <div class="card mb-4">
                        <div class="card-header bg-primary text-white">
                            <h5 class="mb-0">Personal Information</h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <p class="fw-bold">Username:</p>
                                    <p><%= customer.getUsername() %></p>
                                    <p class="fw-bold">Email:</p>
                                    <p><%= customer.getEmail() %></p>
                                    
                                    <p class="fw-bold">No Telepon:</p>
                                    <p><%= customer.getPhone() %></p>
                                </div>
                                <div class="col-md-6">
                                    <p class="fw-bold">Nama Lengkap:</p>
                                    <p><%= customer.getName() %></p>
                                    <p class="fw-bold">Alamat:</p>
                                    <p><%= customer.getAddress() %></p>
                                </div>
                            </div>
                        </div>
                    </div>

<<<<<<< HEAD
=======
                    <!-- Additional Info -->
                    <div class="card mb-4">
                        <div class="card-body">
                            <h5 class="card-title">Riwayat Pemesanan</h5>
                            <p>Belum ada riwayat pemesanan.</p>
                        </div>
                    </div>
>>>>>>> 57a6d7ff32cb187258f843876e8311d73a8a2f53
                </div>
                         
                <!-- Modal -->
                <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="confirmModalLabel">Konfirmasi</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Apakah Anda yakin ingin menghapus akun?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                                <button type="button" class="btn btn-primary" id="confirmSubmit">Ya, Lanjutkan</button>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
    
    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById('confirmSubmit').addEventListener('click', function () {
            document.getElementById('deleteAccount').submit();
        });
    </script>
</body>
</html>
