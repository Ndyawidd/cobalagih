<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Blog - EasyKost</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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

    <div class="container my-5">
        <h2 class="text-primary">Artikel dan Tips Kebersihan</h2>
        <p>Berikut adalah beberapa artikel dan tips untuk menjaga kebersihan rumah Anda:</p>
        <div class="row">
            <div class="col-md-4">
                <h5>Tips Membersihkan Karpet</h5>
                <p>Pelajari cara membersihkan karpet dengan benar untuk menjaga keawetannya.</p>
            </div>
            <div class="col-md-4">
                <h5>Manfaat Layanan Cleaning</h ```jsp
                <h5>Manfaat Layanan Cleaning</h5>
                <p>Kenali manfaat menggunakan layanan cleaning untuk efisiensi waktu dan hasil yang lebih baik.</p>
            </div>
            <div class="col-md-4">
                <h5>Produk Pembersih Ramah Lingkungan</h5>
                <p>Temukan produk pembersih yang aman untuk lingkungan dan keluarga Anda.</p>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>