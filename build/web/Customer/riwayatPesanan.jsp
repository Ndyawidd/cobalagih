<%@page import="models.Customer"%> <%@page import="models.Order"%> <%@page
import="models.layanan"%> <%@page import="java.util.ArrayList"%> <%@page
contentType="text/html" pageEncoding="UTF-8"%> <% HttpSession userSession =
request.getSession(false); if (userSession == null ||
userSession.getAttribute("user") == null) {
response.sendRedirect("../index.jsp"); return; } ArrayList<Order>
  orders = (ArrayList<Order
    >) request.getAttribute("orders"); layanan layanans = new layanan();
    Customer customer = new Customer(); customer.setId((Integer)
    session.getAttribute("customerId")); %>
    <!DOCTYPE html>
    <html lang="id">
      <head>
        <title>Riwayat Pesanan</title>
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
          /* Gaya untuk halaman utama */
          .content {
            background-color: #f9fafb;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
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
                  <a
                    class="nav-link"
                    href="<%= request.getContextPath() %>/customerr/layanan"
                    >Layanan</a
                  >
                </li>
                <li class="nav-item">
                  <a
                    class="nav-link"
                    href="<%= request.getContextPath() %>/customerr/payment"
                    >Payment</a
                  >
                </li>
                <li class="nav-item">
                  <a
                    class="nav-link"
                    href="<%= request.getContextPath() %>/customerr/profile"
                    >Profile</a
                  >
                </li>
                <li class="nav-item">
                  <a
                    class="nav-link active"
                    href="<%= request.getContextPath() %>/customerr/riwayatPesanan"
                    >Riwayat Pesanan</a
                  >
                </li>
                <li class="nav-item">
                  <form
                    method="POST"
                    action="<%= request.getContextPath() %>/auth"
                    style="display: inline"
                  >
                    <input type="hidden" name="action" value="logout" />
                    <button type="submit" class="btn btn-danger w-100 mt-2">
                      Logout
                    </button>
                  </form>
                </li>
              </ul>
            </nav>
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 content">
              <div class="container my-5">
                <% if (request.getParameter("success") != null) { %>
                <div class="alert alert-success mt-3 text-center">
                  Berhasil membuat pesanan
                </div>
                <% } %>
                <h2 class="text-primary">Riwayat Pesanan</h2>
                <div class="table-responsive">
                  <table class="table table-striped table-hover mt-4">
                    <thead class="table-dark">
                      <tr>
                        <th>Layanan</th>
                        <th>Nama</th>
                        <th>Status</th>
                        <th>Aksi</th>
                      </tr>
                    </thead>
                    <tbody>
                      <% if (orders != null && !orders.isEmpty()) { for (Order
                      order : orders) { if (order.getCustomerId() ==
                      customer.getId()){ %>
                      <tr>
                        <td>
                          <%= layanans.getNameByID(order.getServiceId())%>
                        </td>
                        <td><%= order.getFullName() %></td>
                        <td>
                          <% String status = order.getStatus(); String
                          statusClass; switch (status.toLowerCase()) { case
                          "cancel": statusClass = "bg-danger text-white"; break;
                          case "pending": statusClass = "bg-secondary
                          text-white"; break; case "confirmed": statusClass =
                          "bg-success text-white"; break; default: statusClass =
                          "bg-secondary text-white"; // Untuk status lain } %>
                          <span class="<%= statusClass %> badge p-2">
                            <%= status %>
                          </span>
                        </td>
                        <td>
                          <a
                            href="order?menu=summary&id=<%= order.getOrderId() %>"
                            class="btn btn-warning btn-sm text-white"
                            >Lihat Ringkasan</a
                          >
                        </td>
                      </tr>
                      <% }} } else { %>
                      <tr>
                        <td colspan="5" class="text-center">
                          Tidak ada pesanan yang tersedia.
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
    </html></Order
  ></Order
>
