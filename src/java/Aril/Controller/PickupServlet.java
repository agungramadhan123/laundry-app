package Aril.Controller;

import Aril.Model.Order;
import Aril.Model.OrderDAO;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "PickupServlet", urlPatterns = {"/pickup", "/pickup/*", "/_pickup"})
public class PickupServlet extends HttpServlet {

    private final OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ==== kalau masih ada yang akses URL lama: /_pickup?action=list ====
        String action = request.getParameter("action");
        if (action != null && !action.isBlank()) {
            String ctx = request.getContextPath();
            if ("list".equalsIgnoreCase(action)) {
                response.sendRedirect(ctx + "/pickup/list");
                return;
            }
            if ("form".equalsIgnoreCase(action)) {
                String id = request.getParameter("id");
                response.sendRedirect(ctx + "/pickup/form?id=" + (id == null ? "" : id));
                return;
            }
        }

        // ==== URL rapi (REST-ish): /pickup/list, /pickup/form?id= ====
        String pathInfo = request.getPathInfo(); // "/list", "/form"
        String servletPath = request.getServletPath(); // "/pickup" atau "/_pickup"

        // kalau akses /pickup (tanpa /list) -> redirect ke /pickup/list
        if (pathInfo == null || "/".equals(pathInfo)) {
            response.sendRedirect(request.getContextPath() + "/pickup/list");
            return;
        }

        try {
            if ("/list".equals(pathInfo)) {
                List<Order> orders = orderDAO.listReadyForPickup();
                request.setAttribute("orders", orders);
                request.getRequestDispatcher("/pickup_list.jsp").forward(request, response);
                return;
            }

            if ("/form".equals(pathInfo)) {
                String idStr = request.getParameter("id");
                if (idStr == null) {
                    response.sendError(400, "Missing id");
                    return;
                }
                int id = Integer.parseInt(idStr);

                Order order = orderDAO.findById(id);
                if (order == null) {
                    response.sendError(404, "Order not found in DB");
                    return;
                }

                request.setAttribute("order", order);
                request.getRequestDispatcher("/pickup_form.jsp").forward(request, response);
                return;
            }

            response.sendError(404, "Not found: " + servletPath + pathInfo);

        } catch (SQLException e) {
            throw new ServletException("DB error: " + e.getMessage(), e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pathInfo = request.getPathInfo(); // "/confirm"
        if (pathInfo == null) pathInfo = "";

        if (!"/confirm".equals(pathInfo)) {
            response.sendError(404, "Not found");
            return;
        }

        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            String method = request.getParameter("paymentMethod");
            int amountPaid = Integer.parseInt(request.getParameter("amountPaid"));
            String receiverName = request.getParameter("receiverName");

            Order order = orderDAO.findById(orderId);
            if (order == null) {
                response.sendError(404, "Order not found");
                return;
            }

            if (amountPaid < order.getTotal()) {
                request.setAttribute("error", "Uang kurang. Minimal bayar: " + order.getTotal());
                request.setAttribute("order", order);
                request.getRequestDispatcher("/pickup_form.jsp").forward(request, response);
                return;
            }

            boolean ok = orderDAO.confirmPaymentAndPickup(orderId, method, amountPaid, receiverName);
            if (!ok) {
                response.sendError(409, "Order gagal diproses (status bukan SIAP_DIAMBIL atau sudah berubah).");
                return;
            }

            int change = amountPaid - order.getTotal();
            request.setAttribute("nota", order.getNota());
            request.setAttribute("customer", order.getCustomerName());
            request.setAttribute("status", "SELESAI");
            request.setAttribute("total", order.getTotal());
            request.setAttribute("paid", amountPaid);
            request.setAttribute("change", change);
            request.setAttribute("method", method);
            request.setAttribute("receiver", receiverName);

            request.getRequestDispatcher("/receipt.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new ServletException("DB error: " + e.getMessage(), e);
        }
    }
}
