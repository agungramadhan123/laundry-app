<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    >
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
    >
    <meta charset="UTF-8">
    <title>Admin Page</title>

    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        background: #0b1220;
        color: #e5e7eb;
      }

      .navbar {
        background-color: #0f172a !important;
        border-bottom: 1px solid rgba(255, 255, 255, .08);
      }

      .navbar .nav-link,
      .navbar-text {
        color: #e5e7eb !important;
      }

      .wrap {
        max-width: 1000px;
        margin: 24px auto;
        padding: 0 16px;
      }

      .card {
        background: #111827;
        border: 1px solid rgba(255, 255, 255, .08);
        border-radius: 12px;
        padding: 16px;
        box-shadow: 0 10px 24px rgba(0, 0, 0, .35);
      }

      h1 {
        margin: 0;
        font-size: 20px;
        color: #fff;
      }

      .muted {
        color: #9ca3af;
        margin-top: 6px;
        font-size: 13px;
      }

      .toolbar {
        display: flex;
        justify-content: space-between;
        gap: 10px;
        flex-wrap: wrap;
        align-items: center;
        margin-top: 10px;
      }

      input[type="text"] {
        padding: 9px 10px;
        border: 1px solid rgba(255, 255, 255, .12);
        border-radius: 8px;
        background: #0b1220;
        color: #e5e7eb;
        width: 260px;
        outline: none;
      }

      input[type="text"]:focus {
        border-color: #3b82f6;
      }

      table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 12px;
      }

      th,
      td {
        padding: 10px;
        border-top: 1px solid rgba(255, 255, 255, .08);
        text-align: left;
        font-size: 14px;
      }

      th {
        background: rgba(255, 255, 255, .03);
        font-weight: 800;
        color: #cbd5e1;
      }

      .right {
        text-align: right;
      }

      .badge {
        display: inline-block;
        padding: 4px 10px;
        border-radius: 999px;
        font-size: 12px;
        font-weight: 800;
        border: 1px solid rgba(59, 130, 246, .35);
        background: rgba(59, 130, 246, .12);
        color: #93c5fd;
      }

      .btn {
        display: inline-block;
        padding: 9px 12px;
        border-radius: 8px;
        text-decoration: none;
        border: 1px solid rgba(255, 255, 255, .12);
        background: rgba(255, 255, 255, .04);
        color: #e5e7eb;
        font-weight: 800;
      }

      .btn:hover {
        background: rgba(255, 255, 255, .07);
      }

      .btn-primary {
        background: #2563eb;
        border-color: #2563eb;
        color: #fff;
      }

      .btn-primary:hover {
        background: #1d4ed8;
      }

      .empty {
        padding: 18px;
        color: #9ca3af;
        text-align: center;
      }

      .content {
        background-color: #111827;
        position: relative;
        padding: 40px 20px 80px;
      }
    </style>
  </head>

  <body>
    <!-- NAVBAR -->
    <nav class="navbar navbar-expand-lg navbar-dark">
      <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
          <div class="navbar-nav">
            <a
              class="nav-link"
              href="${pageContext.request.contextPath}/Zikra/Admin.jsp"
            >
              <i class="fa-solid fa-house"></i>
            </a>
          </div>
        </div>

        <i class="fa-regular fa-bell" style="margin-right: 30px"></i>

        <div class="ms-auto d-flex align-items-center" style="margin-right: 5px">
          <span class="navbar-text me-2">
            <a
              class="nav-link d-flex align-items-center gap-2"
              href="${pageContext.request.contextPath}/Zikra/ProfilAdmin.jsp"
            >
              <div
                class="text-white rounded-circle shadow d-flex justify-content-center align-items-center"
                style="
                  width: 30px;
                  height: 30px;
                  background-color: #e9ecef;
                  margin-right: 10px;
                "
              >
                <i class="fa-solid fa-user"></i>
              </div>
              Zikra
            </a>
          </span>
        </div>
      </div>
    </nav>

    <!-- KONTEN UTAMA -->
    <div class="content">
      <%
        String currentStatus = "process";
        String nextStatus = "ready to taken";

        String flash = null;
        String flashErr = null;

        if ("POST".equalsIgnoreCase(request.getMethod())) {
          String action = request.getParameter("action");

          if ("move".equals(action)) {
            try {
              int orderId = Integer.parseInt(request.getParameter("orderId"));

              try (java.sql.Connection c = Aril.Model.DBConnection.getConnection();
                   java.sql.PreparedStatement ps = c.prepareStatement(
                     "UPDATE orders SET status=? WHERE id=? AND status=?"
                   )) {

                ps.setString(1, nextStatus);
                ps.setInt(2, orderId);
                ps.setString(3, currentStatus);

                boolean ok = ps.executeUpdate() > 0;

                if (ok) {
                  flash = "Status berhasil diubah: process → ready to taken";
                } else {
                  flash = "Gagal: data tidak ditemukan / status sudah berubah.";
                }
              }
            } catch (Exception e) {
              flashErr = "Error: " + e.getMessage();
            }
          }
        }

        java.util.List<Aril.Model.Order> orders = new java.util.ArrayList<>();
        String err = null;

        try (java.sql.Connection c = Aril.Model.DBConnection.getConnection();
             java.sql.PreparedStatement ps = c.prepareStatement(
               "SELECT id, nota, customer_name, total, status " +
               "FROM orders WHERE status=? ORDER BY id DESC"
             )) {

          ps.setString(1, currentStatus);

          try (java.sql.ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
              Aril.Model.Order o = new Aril.Model.Order();
              o.setId(rs.getInt("id"));
              o.setNota(rs.getString("nota"));
              o.setCustomerName(rs.getString("customer_name"));
              o.setTotal(rs.getInt("total"));
              o.setStatus(rs.getString("status"));
              orders.add(o);
            }
          }
        } catch (Exception e) {
          err = e.getMessage();
        }

        java.text.NumberFormat rupiah =
          java.text.NumberFormat.getCurrencyInstance(
            new java.util.Locale("id", "ID")
          );
      %>

      <h1 class="mb-2">
        Pesanan Diproses
        <span class="badge"><%= orders.size() %> process</span>
      </h1>

      <div class="muted mb-4">
        Pesanan sedang dicuci (status: <b>process</b>).
        Klik tombol untuk ubah ke <b>ready to taken</b>.
      </div>

      <% if (flash != null) { %>
        <div
          class="card"
          style="
            border-color: rgba(34, 197, 94, .35);
            background: rgba(34, 197, 94, .08);
            margin-bottom: 12px;
          "
        >
          <b>
            <i class="fa-solid fa-circle-check"></i>
            <%= flash %>
          </b>
        </div>
      <% } %>

      <% if (flashErr != null) { %>
        <div
          class="card"
          style="
            border-color: rgba(239, 68, 68, .35);
            background: rgba(239, 68, 68, .08);
            margin-bottom: 12px;
          "
        >
          <b>
            <i class="fa-solid fa-triangle-exclamation"></i>
            <%= flashErr %>
          </b>
        </div>
      <% } %>

      <div class="card">
        <div class="toolbar">
          <div></div>
          <input
            id="q"
            type="text"
            placeholder="Cari nota / pelanggan..."
            onkeyup="filterTable()"
          >
        </div>

        <% if (err != null) { %>
          <div class="empty">
            DB error: <%= err %>
          </div>

        <% } else if (orders.isEmpty()) { %>
          <div class="empty">
            Belum ada pesanan dengan status <b>process</b>.
          </div>

        <% } else { %>
          <table id="tbl">
            <thead>
              <tr>
                <th>No Nota</th>
                <th>Pelanggan</th>
                <th class="right">Total</th>
                <th>Status</th>
                <th class="right">Aksi</th>
              </tr>
            </thead>

            <tbody>
              <% for (Aril.Model.Order o : orders) { %>
                <tr>
                  <td>
                    <b><%= o.getNota() %></b>
                  </td>

                  <td><%= o.getCustomerName() %></td>

                  <td class="right">
                    <%= rupiah.format(o.getTotal()) %>
                  </td>

                  <td>
                    <span class="badge"><%= o.getStatus() %></span>
                  </td>

                  <td class="right">
                    <form
                      method="post"
                      style="display:inline;"
                      onsubmit="return confirm('Ubah status process → ready to taken?');"
                    >
                      <input type="hidden" name="action" value="move">
                      <input type="hidden" name="orderId" value="<%= o.getId() %>">

                      <button class="btn btn-primary" type="submit">
                        <i class="fa-solid fa-box"></i>
                        Set Ready
                      </button>
                    </form>
                  </td>
                </tr>
              <% } %>
            </tbody>
          </table>
        <% } %>
      </div>

      <script>
        function filterTable() {
          var q = document.getElementById("q").value.toLowerCase();
          var tbl = document.getElementById("tbl");

          if (!tbl) return;

          var rows = tbl.getElementsByTagName("tr");

          for (var i = 1; i < rows.length; i++) {
            var t = rows[i].innerText.toLowerCase();

            if (t.indexOf(q) > -1) {
              rows[i].style.display = "";
            } else {
              rows[i].style.display = "none";
            }
          }
        }
      </script>
    </div>
  </body>
</html>
