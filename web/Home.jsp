<%@page import="models.layanan"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<layanan> layanans = (ArrayList<layanan>) request.getAttribute("layanans");
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - EasyKost</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .hero-section {
            text-align: center;
            margin-top: 40px;
        }

        .swiper-container {
            width: 100%;
            padding: 20px 0;
        }

        .service-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            background-color: #f9f9f9;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .service-card h5 {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .service-card p {
            font-size: 14px;
            color: #555;
            margin-bottom: 15px;
        }

        .service-card .btn-pesan {
            background-color: #0056b3;
            color: white;
            border-radius: 5px;
            padding: 10px 20px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .service-card .btn-pesan:hover {
            background-color: #ff6347;
        }

    </style>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>
<body>
    
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="<%= request.getContextPath() %>/content/home">EasyKost</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/home">Layanan</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/home?action=promo">Promo</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/home?action=blog">Blog</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= request.getContextPath() %>/home?action=tentang">Tentang Kami</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="home?action=login">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="home?action=register">Register</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="hero-section">
        <h1>Layanan Kebersihan EasyKost</h1>
        <p>Pilih layanan jasa cleaning terlengkap yang sesuai dengan kebutuhan hunian Anda</p>
        <div class="container">
            <!-- Service Cards -->
            <div class="swiper-container">
                <div class="swiper-wrapper">
                <% if (layanans != null && !layanans.isEmpty()) {
                    for (layanan layanan : layanans) { %>
                        <div class="swiper-slide">
                            <div class="service-card">
                                <h5><%= layanan.getName() %></h5>
                                <p>Mulai dari Rp <%= (int) layanan.getPrice() %></p>
                                <a href="layanan?menu=view" class="btn-pesan">Pesan Sekarang</a>
                            </div>
                        </div>
                <% } } else { %>
                        <div class="col-12">
                            <p class="text-center">Tidak ada layanan tersedia.</p>
                        </div>
                <% } %>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <!-- Pagination -->
                <div class="swiper-pagination"></div>
            </div>
            <script>
            const swiper = new Swiper('.swiper-container', {
                slidesPerView: 3, // Menampilkan 3 kartu sekaligus
                spaceBetween: 20, // Jarak antar kartu
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
                pagination: {
                    el: '.swiper-pagination',
                    clickable: true,
                },
                breakpoints: {
                    768: {
                        slidesPerView: 2, // 2 kartu untuk tablet
                    },
                    480: {
                        slidesPerView: 1, // 1 kartu untuk ponsel
                    },
                },
            });
            </script>
        </div>
    </div>
        
                    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>