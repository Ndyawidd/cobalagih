package controllers;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Product;

@WebServlet(name = "ProductController", urlPatterns = {"/product"})
public class ProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String role = (String) session.getAttribute("role");
    String menu = request.getParameter("menu");
    if (menu == null || menu.isEmpty()) {
        response.sendRedirect("product?menu=view");
        return;
    }

    Product productModel = new Product();

    if ("view".equals(menu)) {
        ArrayList<Product> products = productModel.get();
        request.setAttribute("products", products);
        if ("admin".equals(role)) {
            request.getRequestDispatcher("/product/admin_view.jsp").forward(request, response);
        } else if ("customer".equals(role)) {
            request.getRequestDispatcher("/product/customer_view.jsp").forward(request, response);
        }
    } else if ("add".equals(menu) || "edit".equals(menu) || "delete".equals(menu)) {
        if (!"admin".equals(role)) {
            response.sendRedirect("product?menu=view");
            return;
        }

        // Logika add/edit/delete untuk admin
        if ("add".equals(menu)) {
            request.getRequestDispatcher("/product/add.jsp").forward(request, response);
        } else if ("edit".equals(menu)) {
            String id = request.getParameter("id");
            Product product = productModel.find(id);
            if (product != null) {
                request.setAttribute("product", product);
                request.getRequestDispatcher("/product/edit.jsp").forward(request, response);
            } else {
                response.sendRedirect("product?menu=view");
            }
        } else if ("delete".equals(menu)) {
            String id = request.getParameter("id");
            if (id != null) {
                productModel.setId(Integer.parseInt(id));
                productModel.delete();
            }
            response.sendRedirect("product?menu=view");
        }
    }
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        String action = request.getParameter("action");
        Product productModel = new Product();

        if ("add".equals(action)) {
            String name = request.getParameter("nama");
            double price = Double.parseDouble(request.getParameter("harga"));

            productModel.setName(name);
            productModel.setPrice(price);
            productModel.insert();

        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("nama");
            double price = Double.parseDouble(request.getParameter("harga"));

            productModel.setId(id);
            productModel.setName(name);
            productModel.setPrice(price);
            productModel.update();

        // (#3.6) Lakukan pengecekan apakah var action bernilai "delete"
        } else if ("delete".equals(action)) {
            // (#3.7) var id menyimpan nilai request parameter "id", lakukan juga parseInt
            int id = Integer.parseInt(request.getParameter("id"));
            // (#3.8) Dari object Product yang telah dibuat sebelumnya, lakukan setId dengan nilai var id
            productModel.setId(id);
            // (#3.9) Dari object Product yang telah dibuat sebelumnya, panggil method delete
            productModel.delete();
        }

        response.sendRedirect("product?menu=view");
    }
}