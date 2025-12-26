<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="model.Order"%>
<!DOCTYPE html>
<html>
<head>
  <title>Pembayaran & Pengambilan</title>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <style>
    body{font-family:Arial,sans-serif;margin:0;background:#f5f7fb;color:#111827;}
    .wrap{max-width:1000px;margin:24px auto;padding:0 16px;}
    .topbar{background:#fff;border-bottom:1px solid #e5e7eb;}
    .topbar .inner{max-width:1000px;margin:0 auto;padding:14px 16px;display:flex;justify-content:space-between;align-items:center;}
    .brand{font-weight:800;}
    .btn{display:inline-block;padding:8px 12px;border-radius:6px;text-decoration:none;border:1px solid #d1d5db;background:#fff;color:#111827;font-weight:700;}
    .btn:hover{background:#f3f4f6;}
    .btn-primary{background:#2563eb;border-color:#2563eb;color:#fff;}
    .btn-primary:hover{background:#1d4ed8;}
    .card{background:#fff;border:1px solid #e5e7eb;border-radius:10px;padding:14px;margin-top:16px;}
    h1{margin:0;font-size:20px;}
    .muted{color:#6b7280;margin-top:6px;font-size:13px;}
    .toolbar{display:flex;justify-content:space-between;gap:10px;flex-wrap:wrap;align-items:center;margin-top:10px;}
    input[type="text"]{padding:8px 10px;border:1px solid #d1d5db;border-radius:6px;width:260px;}
    table{width:100%;border-collapse:collapse;margin-top:12px;}
    th,td{padding:10px;border-top:1px solid #e5e7eb;text-align:left;font-size:14px;}
    th{background:#f9fafb;font-weight:800;color:#374151;}
    .right{text-align:right;}
    .badge{display:inline-block;padding:4px 10px;border-radius:999px;font-size:12px;font-weight:800;border:1px solid #fed7aa;background:#fff7ed;color:#9a3412;}
    .empty{padding:18px;color:#6b7280;text-align:center;}
  </style>
</head>
<body>
<%
  String ctx = request.getContextPath();
  List<Order> orders = (List<Order>) request.getAttribute("orders");
  NumberFormat rupiah = NumberFormat.getCurrencyInstance(new Locale("id","ID"));
%>

<div class="topbar">
  <div class="inner">
    <div class="brand">Laundry Admin</div>
    <a class="btn" href="<%= ctx %>/pickup/list">Refresh</a>
  </div>
</div>

<div class="wrap">
  <div class="card">
    <h1>Daftar Pesanan Siap Diambil</h1>
    <div class="muted">Klik Proses untuk konfirmasi pembayaran & pengambilan.</div>

    <div class="toolbar">
      <div></div>
      <input id="q" type="text" placeholder="Cari nota / pelanggan..." onkeyup="filterTable()"/>
    </div>

    <%
      if (orders == null || orders.isEmpty()) {
    %>
      <div class="empty">Belum ada data (atau belum ada pesanan status SIAP_DIAMBIL).</div>
    <%
      } else {
    %>
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
      <% for (Order o : orders) { %>
        <tr>
          <td><b><%= o.getNota() %></b></td>
          <td><%= o.getCustomerName() %></td>
          <td class="right"><%= rupiah.format(o.getTotal()) %></td>
          <td><span class="badge"><%= o.getStatus() %></span></td>
          <td class="right">
            <a class="btn btn-primary" href="<%= ctx %>/pickup/form?id=<%= o.getId() %>">Proses</a>
          </td>
        </tr>
      <% } %>
      </tbody>
    </table>
    <% } %>
  </div>
</div>

<script>
function filterTable(){
  var q = document.getElementById("q").value.toLowerCase();
  var tbl = document.getElementById("tbl");
  if(!tbl) return;
  var rows = tbl.getElementsByTagName("tr");
  for (var i=1;i<rows.length;i++){
    var t = rows[i].innerText.toLowerCase();
    rows[i].style.display = t.indexOf(q) > -1 ? "" : "none";
  }
}
</script>
</body>
</html>
