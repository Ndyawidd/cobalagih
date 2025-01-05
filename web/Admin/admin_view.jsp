<%@page import="models.layanan"%> <%@page import="java.util.ArrayList"%> <%@page
contentType="text/html" pageEncoding="UTF-8"%> <% HttpSession userSession =
request.getSession(false); if (userSession == null ||
userSession.getAttribute("user") == null) { response.sendRedirect("index.jsp");
return; } ArrayList<layanan>
  layanans = (ArrayList<layanan
    >) request.getAttribute("layanans"); %>
    <!DOCTYPE html>
    <html lang="id">
      <head>
        <title>Dashboard Layanan</title>
        <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
        />
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

          /* Gaya untuk halaman utama */
          .content {
            background-color: #f9fafb;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
          }

          /* Gaya heading */
          h2.text-primary {
            color: #4a90e2;
            font-weight: 600;
          }

          /* Tombol "Tambah Layanan" */
          .btn-success {
            background-color: #38c172;
            border-color: #38c172;
            transition: all 0.3s ease-in-out;
          }

          .btn-success:hover {
            background-color: #2fa566;
            border-color: #2fa566;
          }

          /* Table styling */
          .table {
            border-collapse: collapse;
            width: 100%;
            background-color: #ffffff;
            overflow: hidden;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
          }

          /* Header table */
          .table thead {
            background-color: #4a90e2;
            color: #ffffff;
          }

          .table thead th {
            padding: 15px;
            font-size: 16px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            border: none;
          }

          /* Body table */
          .table tbody tr {
            transition: all 0.3s ease-in-out;
          }

          .table tbody tr:hover {
            background-color: #f1f5f9;
          }

          .table tbody td {
            padding: 12px 15px;
            color: #333333;
            font-size: 14px;
            border-bottom: 1px solid #dee2e6;
          }

          .table tbody td a.btn {
            font-size: 13px;
            padding: 6px 12px;
          }

          /* Tombol "Edit" */
          .btn-warning {
            background-color: #f7b924;
            border-color: #f7b924;
            color: #ffffff;
          }

          .btn-warning:hover {
            background-color: #d69e1b;
            border-color: #d69e1b;
          }

          /* Tombol "Hapus" */
          .btn-danger {
            background-color: #e3342f;
            border-color: #e3342f;
            color: #ffffff;
          }

          .btn-danger:hover {
            background-color: #cc1f1a;
            border-color: #cc1f1a;
          }

          /* Teks di tengah */
          .text-center {
            text-align: center;
            color: #6c757d;
            font-size: 14px;
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
                    <a
                      class="nav-link active"
                      href="<%= request.getContextPath() %>/admin/layanan"
                      >Layanan</a
                    >
                  </li>
                  <li class="nav-item">
                    <a
                      class="nav-link"
                      href="<%= request.getContextPath() %>/admin/customer"
                      >Customer</a
                    >
                  </li>
                  <li class="nav-item">
                    <a
                      class="nav-link"
                      href="<%= request.getContextPath() %>/admin/orderCustomer"
                      >Order Customer</a
                    >
                  </li>
                  <li class="nav-item">
                    <a
                      class="nav-link"
                      href="<%= request.getContextPath() %>/admin/payment"
                      >Payment</a
                    >
                  </li>
                  <li class="nav-item">
                    <div class="mb-3">
                      <form
                        method="POST"
                        action="<%= request.getContextPath() %>/auth"
                        style="display: inline"
                      >
                        <input type="hidden" name="action" value="logout" />
                        <button type="submit" class="btn btn-danger">
                          Logout
                        </button>
                      </form>
                    </div>
                  </li>
                </ul>
              </div>
            </nav>
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 content">
              <div class="container my-5">
                <div
                  class="d-flex justify-content-between align-items-center mb-4"
                >
                  <h2 class="text-primary">Daftar Layanan</h2>
                  <a
                    href="<%= request.getContextPath() %>/layanan?menu=add"
                    class="btn btn-success btn-lg"
                    >Tambah Layanan</a
                  >
                </div>

                <div class="table-responsive">
                  <table class="table table-striped table-hover">
                    <thead class="table-dark">
                      <tr>
                        <th>Nama</th>
                        <th>Deskripsi</th>
                        <th>Harga</th>
                        <th>Durasi</th>
                        <th class="justify-content-center d-flex">Aksi</th>
                      </tr>
                    </thead>
                    <tbody>
                      <% if (layanans != null && !layanans.isEmpty()) { for
                      (layanan layananItem : layanans) { %>
                      <tr>
                        <td><%= layananItem.getName() %></td>
                        <td><%= layananItem.getDeskripsi() %></td>
                        <td><%= layananItem.getPrice() %></td>
                        <td><%= layananItem.getDurasi() %></td>
                        <td>
                          <a
                            href="<%= request.getContextPath() %>/layanan?menu=edit&id=<%= layananItem.getId() %>"
                            class="btn btn-warning btn-sm"
                            >Edit</a
                          >
                          <form
                            method="POST"
                            action="<%= request.getContextPath() %>/layanan"
                            style="display: inline"
                          >
                            <input type="hidden" name="action" value="delete" />
                            <input
                              type="hidden"
                              name="id"
                              value="<%= layananItem.getId() %>"
                            />
                            <button
                              type="submit"
                              class="btn btn-danger btn-sm"
                              onclick="return confirm('Apakah Anda yakin ingin menghapus layanan ini?');"
                            >
                              Hapus
                            </button>
                          </form>
                        </td>
                      </tr>
                      <% } } else { %>
                      <tr>
                        <td colspan="5" class="text-center">
                          Tidak ada data layanan.
                        </td>
                      </tr>
                      <% } %>
                    </tbody>
                  </table>
                </div>
              </div>
            </main>
          </div>
        </div>
      </body>
    </html>
  </layanan></layanan
>
