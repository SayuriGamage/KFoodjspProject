package lk.ijse.koreanfoodjspproject.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.koreanfoodjspproject.dao.impl.Cartdaoimpl;
import lk.ijse.koreanfoodjspproject.dao.impl.Orderdaoimpl;
import lk.ijse.koreanfoodjspproject.entity.Cart;
import lk.ijse.koreanfoodjspproject.entity.Order;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/saveOrder")
public class OrderServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("loginEmail");
        String date = req.getParameter("expiryDate");
        String total = req.getParameter("totalPayment");
        String card = req.getParameter("cardName");

        Order order = new Order(email, date, total, card);

        try (Connection connection = dataSource.getConnection()) {
            // Insert the order into the orders table
            PreparedStatement ps = connection.prepareStatement("INSERT INTO orders(customerEmail, orderDate, total, card) VALUES (?, ?, ?, ?)");
            ps.setString(1, email);
            ps.setString(2, date);
            ps.setString(3, total);
            ps.setString(4, card);

            int result = ps.executeUpdate();
            if (result > 0) {

                Cartdaoimpl cartdaoimpl = new Cartdaoimpl();
                List<Cart> carts = cartdaoimpl.getCar(connection, email);


                Orderdaoimpl orderdaoimpl = new Orderdaoimpl();
                int orderId = orderdaoimpl.getOrderId(email, connection);


                for (Cart cart : carts) {

                    PreparedStatement psOrderDetails = connection.prepareStatement("INSERT INTO order_details(orderId, productId) VALUES (?, ?)");
                    psOrderDetails.setInt(1, orderId);
                    psOrderDetails.setInt(2, cart.getPro_id());

                    psOrderDetails.executeUpdate();
                }


                cartdaoimpl.clearCart(connection, email);

                resp.sendRedirect("orders.jsp?status=success");
            } else {
                System.out.println("Order not added");
                resp.sendRedirect("orders.jsp");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database error occurred", e);
        }
    }
}

