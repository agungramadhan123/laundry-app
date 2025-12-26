<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="controller.PickupServlet.OrderView"%>
<!DOCTYPE html>
<html>
<head>
    <title>Konfirmasi Pembayaran</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <style>
        body{font-family:Arial, sans-serif; margin:0; background:#f5f7fb; color:#111827;}
        .wrap{max-width:850px; margin:24px auto; padding:0 16px;}
        .card{background:#fff; border:1px solid #e5e7eb; border-radius:10px; padding:16px;}
        h1{margin:0 0 10px; font-size:20px;}
        .muted{color:#6b7280; font-size:13px; margin-bottom:12px;}
        .row{display:flex; justify-content:space-between; padding:8px 0; border-top:1px solid #f1f5f9;}
        .row:first-child{border-top:none;}
        .label{color:#6b7280; font-weight:700;}
        .btn{display:inline-block; padding:8px 12px; border-radius:6px; text-decoration:none; border:1px solid #d1d5db; color:#111827; background:#fff; font-weight:700;}
        .btn:hover{background:#f3f4f6;}
        .btn-primary{background:#2563eb; border-color:#2563eb; color:#fff;}
        .btn-primary:hover{background:#1d4ed8;}
        .grid{display:grid; grid-template-columns:1fr 1fr; gap:12px; margin-top:14px;}
        .field{display:flex; flex-direction:column; gap:6px;}
        .field label{font-size:13px; font-weight:800; color:#374151;}
        .field input, .field select{padding:9px 10px; border:1px solid #d1d5db; border-radius:6px;}
        .full{grid-column:1 / -1;}
        .actions{display:flex; justify-content:space-between; align-items:center; gap:10px; flex-wrap:wrap; margin-top:14px;}
        .error{background:#fef2f2; border:1px solid #fecaca; color:#991b1b; padding:10px; border-radius:8px; font-weight:800; margin-bottom:12px;}
        .note{color:#6b7280; font-size:12px;}
    </style>
</head>
<body>
<%
    String ctx = request.getContextPath();
    OrderView order = (OrderView) request.getAttribute("order");
    String error = (String) request.getAttribute("error");
    NumberFormat rupiah = NumberFormat.getCurrencyInstance(new Locale("id","ID"));
%>

<div class="wrap">
    <div class="card">
        <div style="display:flex; justify-content:space-between; align-items:center; gap:10px; flex-wrap:wrap;">
            <div>
                <h1>Konfirmasi Pembayaran & Pengambilan</h1>
                <div class="muted">Isi pembayaran, nama penerima, lalu cetak nota.</div>
            </div>
            <a class="btn" href="<%= ctx %>/pickup/list">Kembali</a>
        </div>

        <% if (order == null) { %>
            <p>Order tidak ditemukan.</p>
        <% } else { %>

            <% if (error != null) { %>
                <div class="error"><%= error %></div>
            <% } %>

            <div class="row"><div class="label">No Nota</div><div><b><%= order.getNota() %></b></div></div>
            <div class="row"><div class="label">Pelanggan</div><div><%= order.getCustomer() %></div></div>
            <div class="row"><div class="label">Total</div><div><b id="totalText"><%= rupiah.format(order.getTotal()) %></b></div></div>
            <div class="row"><div class="label">Status</div><div>SIAP DIAMBIL</div></div>

            <form action="<%= ctx %>/pickup/confirm" method="post">
                <input type="hidden" name="orderId" value="<%= order.getId() %>"/>
                <input type="hidden" id="totalValue" value="<%= order.getTotal() %>"/>

                <div class="grid">
                    <div class="field">
                        <label>Metode Pembayaran</label>
                        <select name="paymentMethod" required>
                            <option value="CASH">CASH</option>
                            <option value="QRIS">QRIS</option>
                            <option value="TRANSFER">TRANSFER</option>
                        </select>
                    </div>

                    <div class="field">
                        <label>Jumlah Bayar</label>
                        <input type="number" id="amountPaid" name="amountPaid" min="0" required
                               placeholder="minimal: <%= order.getTotal() %>" oninput="calcChange()"/>
                    </div>

                    <div class="field full">
                        <label>Nama Penerima</label>
                        <input type="text" name="receiverName" required placeholder="contoh: Andi / Osas"/>
                    </div>

                    <div class="field">
                        <label>Kembalian (preview)</label>
                        <input type="text" id="changePreview" value="Rp0" readonly/>
                    </div>

                    <div class="field">
                        <label>Status setelah submit</label>
                        <input type="text" value="SELESAI" readonly/>
                    </div>
                </div>

                <div class="actions">
                    <div class="note">Jumlah bayar minimal sama dengan total.</div>
                    <button class="btn btn-primary" type="submit">Konfirmasi & Cetak Nota</button>
                </div>
            </form>
        <% } %>
    </div>
</div>

<script>
function toIDR(n){
  try { return new Intl.NumberFormat('id-ID', {style:'currency', currency:'IDR'}).format(n); }
  catch(e){ return "Rp" + (n||0); }
}
function calcChange(){
  var total = parseInt(document.getElementById("totalValue").value || "0");
  var paid = parseInt(document.getElementById("amountPaid").value || "0");
  var change = paid - total;
  if (change < 0) change = 0;
  document.getElementById("changePreview").value = toIDR(change);
}
</script>
</body>
</html>
