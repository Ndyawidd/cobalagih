<%@page import="models.layanan"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession userSession = request.getSession(false);
    if (userSession == null || userSession.getAttribute("user") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    ArrayList<layanan> layanans = (ArrayList<layanan>) request.getAttribute("layanans");
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Dashboard Layanan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container my-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="text-primary">Daftar Layanan</h2>
            <a href="<%= request.getContextPath() %>/layanan?menu=add" class="btn btn-success btn-lg">Tambah Layanan</a>
        </div>
        <div class="text-end mb-3">
            <form method="POST" action="<%= request.getContextPath() %>/AuthController" style="display: inline;">
                <input type="hidden" name="action" value="logout">
                <button type="submit" class="btn btn-danger">Logout</button>
            </form>
        </div>
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nama</th>
                        <th>Deskripsi</th>
                        <th>Durasi</th>
                        <th>Harga</th>
                        <th>Aksihhhh</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (layanans != null && !layanans.isEmpty()) {
                        for (layanan layanan : layanans) { %>
                    <tr>
                        <td><%= layanan.getId() %></td>
                        <td><%= layanan.getName() %></td>
                        <td><%= layanan.getDeskripsi() %></td>
                        <td><%= layanan.getDurasi() %></td>
                        <td><%= (int) layanan.getPrice() %></td>
                        <td>
                            <a href="<%= request.getContextPath() %>/layanan?menu=edit&id=<%= layanan.getId() %>" class="btn btn-warning btn-sm">Edit</a>
                            <form method="POST" action="<%= request.getContextPath() %>/layanan" style="display: inline;">
                                <input type="hidden" name="action" value="delete" />
                                <input type="hidden" name="id" value="<%= layanan.getId() %>" />
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Apakah Anda yakin ingin menghapus layanan ini?');">Hapus</button>
                            </form>
                        </td>
                    </tr>
                    <% } } else { %>
                    <tr>
                        <td colspan="5" class="text-center">Tidak ada data layanan.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>