<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.layanan"%>
<%@page import="models.Customer"%>
<%
    layanan layananData = (layanan) request.getAttribute("layanan");
    if (layananData == null) {
        response.sendRedirect("order?menu=view");
        return;
    }
    
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Pesan Layanan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Gaya untuk kartu form */
.card {
    border: none;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    background: linear-gradient(145deg, #ffffff, #f3f4f6);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    overflow: hidden;
}

.card-header {
    background-color: #4a90e2;
    color: white;
    padding: 15px 20px;
    font-weight: 700;
    text-align: center;
    border-radius: 12px 12px 0 0;
}

.card-body {
    padding: 30px;
    font-family: 'Arial', sans-serif;
    color: #333;
}

.card-footer {
    background-color: #f9fafb;
    text-align: center;
    padding: 15px;
    border-radius: 0 0 12px 12px;
}

/* Input, textarea, dan select */
.form-control, .form-select {
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 10px;
    font-size: 14px;
    color: #555;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

.form-control:focus, .form-select:focus {
    border-color: #4a90e2;
    box-shadow: 0 0 6px rgba(74, 144, 226, 0.3);
}

/* Label */
.form-label {
    font-weight: 600;
    font-size: 14px;
    color: #333;
    margin-bottom: 8px;
}

/* Tombol utama */
.btn-primary {
    background-color: #4a90e2;
    border-color: #4a90e2;
    font-size: 16px;
    font-weight: 600;
    padding: 10px 20px;
    border-radius: 8px;
    transition: all 0.3s ease;
}

.btn-primary:hover {
    background-color: #357ab8;
    border-color: #357ab8;
    box-shadow: 0 4px 12px rgba(74, 144, 226, 0.4);
}

/* Tombol sekunder */
.btn-secondary {
    background-color: #6c757d;
    border-color: #6c757d;
    color: white;
    font-size: 14px;
    padding: 8px 16px;
    border-radius: 8px;
    transition: all 0.3s ease;
}

.btn-secondary:hover {
    background-color: #5a6268;
    border-color: #5a6268;
    box-shadow: 0 4px 12px rgba(108, 117, 125, 0.4);
}

/* Responsif */
@media (max-width: 768px) {
    .card-body {
        padding: 20px;
    }

    .form-control, .form-select {
        font-size: 13px;
    }

    .btn-primary, .btn-secondary {
        font-size: 14px;
    }
}

    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-lg">
                    <div class="card-header bg-primary text-white text-center">
                        <h2>Form Pesan Layanan</h2>
                    </div>
                    <div class="card-body">
                        <form method="post" action="<%= request.getContextPath() %>/order">
                            <input type="hidden" name="action" value="create">
                            <input type="hidden" name="serviceId" value="<%= layananData.getId() %>">
                            
                            <div class="mb-3">
                                <label class="form-label">Nama Layanan:</label>
                                <input type="text" class="form-control" value="<%= layananData.getName() %>" disabled>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label">Deskripsi Layanan:</label>
                                <input type="text" class="form-control" value="<%= layananData.getDeskripsi() %>" disabled>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Nama:</label>
                                <input type="text" class="form-control" name="fullName" placeholder="Masukkan Nama Anda" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Nomor Telepon:</label>
                                <input type="text" class="form-control" name="phoneNumber" placeholder="Masukkan Nomor Telepon Anda" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Lokasi:</label>
                                <input type="text" class="form-control" name="location" placeholder="Masukkan Lokasi Anda" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Catatan Tambahan:</label>
                                <textarea class="form-control" name="notes" placeholder="Masukkan catatan jika ada"></textarea>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Metode Pembayaran:</label>
                                <select class="form-select" name="paymentMethod" required>
                                    <option value="eWallet">E-Wallet</option>
                                    <option value="bankTransfer">Transfer Bank</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Saldo E-Wallet:</label>
                                <input type="number" class="form-control" name="saldoEWallet" placeholder="Masukkan saldo" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Durasi:</label>
                                <input type="text" class="form-control" value="<%= layananData.getDurasi() %>" disabled>
                                <input type="hidden" class="form-control" name="serviceDuration" value="<%= layananData.getDurasi() %>">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Harga Layanan:</label>
                                <input type="text" class="form-control" value="<%= layananData.getPrice() %>" disabled>
                                <input type="hidden" class="form-control" name="servicePrice" value="<%= layananData.getPrice() %>">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Jadwal Layanan:</label>
                                <input type="date" class="form-control" name="scheduleDate" required>
                            </div>

                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">Pesan Sekarang</button>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer text-center">
                        <a href="order?menu=view" class="btn btn-secondary">Kembali</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
