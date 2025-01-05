package controllers;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Order;
import models.layanan;
import models.Payment;

@WebServlet(name = "OrderController", urlPatterns = {"/order"})
public class OrderController extends HttpServlet {
    private void handleView(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Order orderModel = new Order();
        ArrayList<Order> orders = orderModel.get();

        if (orders == null || orders.isEmpty()) {
            request.setAttribute("message", "Tidak ada pesanan yang tersedia.");
        } else {
            request.setAttribute("orders", orders);
        }

        request.getRequestDispatcher("/Customer/riwayatPesanan.jsp").forward(request, response);
    }
    
    private void handleCreate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String serviceId = request.getParameter("serviceId");
        if (serviceId == null || serviceId.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/order?menu=view");
            return;
        }

        layanan layananModel = new layanan();
        layanan layananData = (layanan) layananModel.find(serviceId);

        if (layananData == null) {
            response.sendRedirect(request.getContextPath() + "/order?menu=view");
        } else {
            request.setAttribute("layanan", layananData);
            request.getRequestDispatcher("/Customer/form_order.jsp").forward(request, response);
        }
    }
    
    private void handleSummary(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderId = request.getParameter("id");
        if (orderId == null || orderId.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/order?menu=view");
            return;
        }

        Order orderModel = new Order();
        Order order = (Order) orderModel.find(orderId);

        if (order == null) {
            response.sendRedirect(request.getContextPath() + "/order?menu=view");
        } else {
            request.setAttribute("order", order);
            request.getRequestDispatcher("/Customer/order_summary.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("customerId") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        String menu = request.getParameter("menu");
        if (menu == null || menu.isEmpty()) {
            response.sendRedirect("order?menu=view");
            return;
        }
        
        try {
            switch (menu) {
                case "view":
                    handleView(request, response);
                    break;

                case "create":
                    handleCreate(request, response);
                    break;

                case "summary":
                    handleSummary(request, response);
                    break;
                    
                default:
                    response.sendRedirect(request.getContextPath() + "/order?menu=view");
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/test.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("customerId") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }
        
        String action = request.getParameter("action");
        Order orderModel = new Order();
        
        if ("create".equals(action)) {
            // Logika untuk membuat pesanan
            // (sama seperti sebelumnya)
            try {
            int serviceId = Integer.parseInt(request.getParameter("serviceId"));
            Integer customerId = (Integer) session.getAttribute("customerId");
            if (customerId == null) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
                return;
            }
            
            String fullName = request.getParameter("fullName");
            String phoneNumber = request.getParameter("phoneNumber");
            String location = request.getParameter("location");
            String notes = request.getParameter("notes");
            String paymentMethod = request.getParameter("paymentMethod");
            
            // Validasi dan parsing saldoEWallet
            String saldoEWalletStr = request.getParameter("saldoEWallet");
            double saldoEWallet = (saldoEWalletStr != null && !saldoEWalletStr.trim().isEmpty()) 
                ? Double.parseDouble(saldoEWalletStr) 
                : 0.0; // Atau bisa throw exception jika tidak valid
            
            String duration = request.getParameter("duration");
            
            // Validasi dan parsing servicePrice
            String servicePriceStr = request.getParameter("servicePrice");
            double servicePrice = (servicePriceStr != null && !servicePriceStr.trim().isEmpty()) 
                ? Double.parseDouble(servicePriceStr) 
                : 0.0; // Atau bisa throw exception jika tidak valid
            
            java.sql.Date scheduleDate = java.sql.Date.valueOf(request.getParameter("scheduleDate"));

            orderModel.setServiceId(serviceId);
            orderModel.setCustomerId(customerId);
            orderModel.setFullName(fullName);
            orderModel.setPhoneNumber(phoneNumber);
            orderModel.setLocation(location);
            orderModel.setNotes(notes);
            orderModel.setStatus("pending");
            orderModel.setSaldoEWallet(saldoEWallet);
            orderModel.setPaymentMethod(paymentMethod);
            orderModel.setDuration(duration);
            orderModel.setServicePrice(servicePrice);
            orderModel.setScheduleDate(scheduleDate);
            orderModel.insert();
            response.sendRedirect("order?menu=view&id=" + orderModel.getOrderId() + "&success=true");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp?message=Invalid input");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/test.jsp");
        }
        } else if ("summary".equals(action)) {
            // Logika untuk menampilkan ringkasan pesanan
            // (sama seperti sebelumnya)
                    String orderId = request.getParameter("id");
               Order order = (Order) orderModel.find(orderId);
               if (order != null) {
                   request.setAttribute("order", order);
                   request.getRequestDispatcher("/Customer/order_summary.jsp").forward(request, response);
               } else {
                   response.sendRedirect("order?menu=view");
               }

        } else if ("pay".equals(action)) {
            try {
                int orderId = Integer.parseInt(request.getParameter("orderId"));
                orderModel.setOrderId(orderId);
                orderModel.setStatus("confirmed");
                orderModel.update(); // Update status pesanan

                // Proses pembayaran
                Payment paymentModel = new Payment();
                paymentModel.setOrderId(orderId);
                paymentModel.setCustomerId((Integer) session.getAttribute("customerId"));
                paymentModel.setPriceLayanan(orderModel.getServicePrice());
                paymentModel.insert(); // Simpan data pembayaran

                response.sendRedirect("order?menu=view");
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect(request.getContextPath() + "/error.jsp?message=Invalid input");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect(request.getContextPath() + "/payment.jsp");
            }
        }
    }
}