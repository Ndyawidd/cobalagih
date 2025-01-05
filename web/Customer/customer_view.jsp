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
    <title>Daftar Layanan</title>
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
        
        h2.text-primary {
    color: #4a90e2;
    font-weight: 700;
    text-align: center;
    margin-bottom: 40px;
}

/* Gaya untuk kartu layanan */
.card {
    border: none;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    overflow: hidden;
    background: linear-gradient(145deg, #ffffff, #f3f4f6);
}

.card:hover {
    transform: translateY(-8px);
    box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
}

/* Gaya untuk konten dalam kartu */
.card-body {
    padding: 20px;
    color: #333;
    text-align: center;
}

/* Judul kartu */
.card-title {
    font-size: 18px;
    font-weight: 700;
    color: #333;
    margin-bottom: 15px;
}

/* Deskripsi kartu */
.card-text {
    font-size: 14px;
    color: #555;
    margin-bottom: 12px;
}

/* Harga dan durasi */
.card-text strong {
    display: block;
    margin-top: 8px;
    font-size: 15px;
    color: #4a90e2;
}

/* Tombol "Pesan Sekarang" */
.btn-primary {
    background-color: #4a90e2;
    border-color: #4a90e2;
    font-size: 14px;
    font-weight: 600;
    padding: 8px 16px;
    border-radius: 8px;
    transition: all 0.3s ease;
}

.btn-primary:hover {
    background-color: #357ab8;
    border-color: #357ab8;
    box-shadow: 0 4px 12px rgba(74, 144, 226, 0.4);
}

/* Pesan tidak ada layanan */
.text-center {
    font-size: 16px;
    color: #888;
    margin-top: 20px;
}

/* Responsif */
@media (max-width: 768px) {
    .sidebar {
        position: relative;
        width: 100%;
        height: auto;
    }

    .content {
        margin-left: 0;
        padding: 15px;
    }

    .card-body {
        padding: 15px;
    }

    .card-title {
        font-size: 16px;
    }

    .card-text {
        font-size: 13px;
    }
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
                            <a class="nav-link active" href="<%= request.getContextPath() %>/customerr/layanan">Layanan</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%= request.getContextPath() %>/customerr/payment">Payment</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%= request.getContextPath() %>/customerr/profile">Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<%= request.getContextPath() %>/customerr/riwayatPesanan">Riwayat Pesanan</a>
                        </li>
                        <li class="nav-item">
                            <div class="mb-3">
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
                        <h2 class="text-primary">Daftar Layanan Tersedia</h2>
                    </div>
                    <div class="row">
                        <% if (layanans != null && !layanans.isEmpty()) {
                            for (layanan layanan : layanans) { %>
                        <div class="col-md-4 mb-4">
                            <div class="card h-100">
                                <div class="card-body">
                                    <h5 class="card-title"><%= layanan.getName() %></h5>
                                    <p class="card-text"><%= layanan.getDeskripsi() %></p>
                                    <p class="card-text"><strong>Harga: Rp <%= String.format("%,d", (int)layanan.getPrice()) %></strong></p>
                                    <p class="card-text"><strong>Durasi: <%= String.format("%,d", layanan.getDurasi()) %></strong></p>
                                    <a href="<%= request.getContextPath() %>/order?menu=create&serviceId=<%= layanan.getId() %>" class="btn btn-primary btn-sm mt-2">Pesan Sekarang</a>
                                </div>
                            </div>
                        </div>
                        <% } } else { %>
                        <div class="col-12">
                            <p class="text-center">Tidak ada layanan tersedia.</p>
                        </div>
                        <% } %>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>