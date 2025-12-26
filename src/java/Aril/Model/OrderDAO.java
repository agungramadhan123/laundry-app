package Aril.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    // =========================
    // EXISTING METHODS (AMAN)
    // =========================
    public List<Order> listReadyForPickup() throws SQLException {
        String sql = "SELECT order_id, nota, customer_name, total, status " +
                     "FROM orders WHERE status='SIAP_DIAMBIL' ORDER BY id DESC";

        List<Order> list = new ArrayList<>();

        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setNota(rs.getString("nota"));
                o.setCustomerName(rs.getString("customer_name"));
                o.setTotal(rs.getInt("total"));
                o.setStatus(rs.getString("status"));
                list.add(o);
            }
        }
        return list;
    }

    public Order findById(int id) throws SQLException {
        String sql = "SELECT id, nota, customer_name, total, status FROM orders WHERE id=?";

        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) return null;

                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setNota(rs.getString("nota"));
                o.setCustomerName(rs.getString("customer_name"));
                o.setTotal(rs.getInt("total"));
                o.setStatus(rs.getString("status"));
                return o;
            }
        }
    }

    public boolean confirmPaymentAndPickup(int orderId, String method, int amountPaid, String receiverName)
            throws SQLException {

        String sql = "UPDATE orders SET " +
                     "payment_method=?, amount_paid=?, receiver_name=?, " +
                     "paid_at=NOW(), picked_up_at=NOW(), status='SELESAI' " +
                     "WHERE id=? AND status='SIAP_DIAMBIL'";

        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setString(1, method);
            ps.setInt(2, amountPaid);
            ps.setString(3, receiverName);
            ps.setInt(4, orderId);

            return ps.executeUpdate() > 0;
        }
    }

    // =========================
    // NEW METHODS (UNTUK 4 HALAMAN ADMIN)
    // =========================

    /**
     * Ambil daftar order berdasarkan status.
     * Dipakai untuk:
     * BARU, DITERIMA, DIPROSES, SIAP_DIAMBIL, dll.
     */
    public List<Order> listByStatus(String status) throws SQLException {
        String sql = "SELECT id, nota, customer_name, total, status " +
                     "FROM orders WHERE status=? ORDER BY id DESC";

        List<Order> list = new ArrayList<>();

        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setString(1, status);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Order o = new Order();
                    o.setId(rs.getInt("id"));
                    o.setNota(rs.getString("nota"));
                    o.setCustomerName(rs.getString("customer_name"));
                    o.setTotal(rs.getInt("total"));
                    o.setStatus(rs.getString("status"));
                    list.add(o);
                }
            }
        }

        return list;
    }

    /**
     * Update status order (dipakai tombol-tombol admin).
     * Untuk mencegah "loncat" status, kita kunci transisi yang valid:
     * BARU -> DITERIMA
     * DITERIMA -> DIPROSES
     * DIPROSES -> SIAP_DIAMBIL
     *
     * Kalau status awal tidak sesuai, update akan gagal (return false).
     */
    public boolean updateStatus(int orderId, String newStatus) throws SQLException {
        String expectedCurrentStatus = null;

        if ("DITERIMA".equalsIgnoreCase(newStatus)) {
            expectedCurrentStatus = "BARU";
        } else if ("DIPROSES".equalsIgnoreCase(newStatus)) {
            expectedCurrentStatus = "DITERIMA";
        } else if ("SIAP_DIAMBIL".equalsIgnoreCase(newStatus)) {
            expectedCurrentStatus = "DIPROSES";
        } else {
            // Kalau kamu mau support transisi lain, tambahkan aturan di sini.
            throw new SQLException("Transisi status tidak diizinkan: -> " + newStatus);
        }

        String sql = "UPDATE orders SET status=? WHERE id=? AND status=?";

        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setString(1, newStatus.toUpperCase());
            ps.setInt(2, orderId);
            ps.setString(3, expectedCurrentStatus);

            return ps.executeUpdate() > 0;
        }
    }
}
