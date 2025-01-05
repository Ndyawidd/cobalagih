<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Tentang Kami - EasyKost</title>
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
                        <a class="nav-link" href="<%= request.getContextPath() %>home">Layanan</a>
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
        <h2 class="text-primary">Tentang Kami</h2>
        <p>EasyKost adalah perusahaan yang menyediakan layanan kebersihan profesional untuk rumah dan kantor. Kami berkomitmen untuk memberikan layanan terbaik dengan menggunakan produk yang aman dan ramah lingkungan.</p>
        <h4>Tim Kami</h4>
        <ul>
            <li><strong>CEO:</strong> Irda</li>
            <li><strong>CTO:</strong> Jay</li>
            <li><strong>COO:</strong> Grace</li>
        </ul>
        <h4>Visi dan Misi</h4>
        <p>Visi kami adalah menjadi penyedia layanan kebersihan terkemuka di Indonesia, sementara misi kami adalah memberikan layanan berkualitas tinggi yang memenuhi kebutuhan pelanggan kami.</p>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>