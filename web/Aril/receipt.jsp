<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<!DOCTYPE html>
<html>
<head>
    <title>Nota Laundry</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <style>
        body{font-family:Arial, sans-serif; margin:0; background:#f5f7fb; color:#111827;}
        .wrap{max-width:850px; margin:24px auto; padding:0 16px;}
        .actions{display:flex; justify-content:flex-end; gap:10px; margin-bottom:12px; flex-wrap:wrap;}
        .btn{display:inline-block; padding:8px 12px; border-radius:6px; text-decoration:none; border:1px solid #d1d5db; color:#111827; background:#fff; font-weight:700; cursor:pointer;}
        .btn:hover{background:#f3f4f6;}
        .btn-primary{background:#2563eb; border-color:#2563eb; color:#fff;}
        .btn-primary:hover{background:#1d4ed8;}
        .nota{max-width:420px; margin:0 auto; background:#fff; border:1px solid #e5e7eb; border-radius:10px; padding:16px;}
        .title{text-align:center; font-weight:900; font-size:18px; margin:0;}
        .sub{text-align:center; color:#6b7280; font-size:12px; margin:6px 0 12px;}
        .line{border-top:1px dashed #d1d5db; margin:12px 0;}
        .row{display:flex; justify-content:space-between; padding:6px 0; font-size:14px;}
        .k{color:#6b7280; font-weight:700;}
        .v{font-weight:800;}
        .footer{text-align:center; color:#6b7280; font-size:12px; margin-top:10px;}

        @media print{
            body{background:#fff;}
            .actions, .back{display:none !important;}
            .wrap{margin:0; padding:0;}
            .nota{border:1px solid #000; border-radius:0;}
        }
    </style>
</head>
<body>
<%
    String ctx = request.getContextPath();

    String nota = (String) request.getAttribute("nota");
    String customer = (String) request.getAttribute("customer");
    String status = (String) request.getAttribute("status");
    String method = (String) request.getAttribute("method");
    Integer total = (Integer) request.getAttribute("total");
    Integer paid = (Integer) request.getAttribute("paid");
    Integer change = (Integer) request.getAttribute("change");
    String receiver = (String) request.getAttribute("receiver");

    if (total == null) total = 0;
    if (paid == null) paid = 0;
    if (change == null) change = 0;

    NumberFormat rupiah = NumberFormat.getCurrencyInstance(new Locale("id","ID"));
%>

<div class="wrap">
    <div class="actions">
        <button class="btn btn-primary" onclick="window.print()">Print</button>
        <a class="btn back" href="<%= ctx %>/pickup/list">Kembali</a>
    </div>

    <div class="nota">
        <div class="title">NOTA LAUNDRY</div>
        <div class="sub">Pembayaran & Pengambilan</div>

        <div class="line"></div>

        <div class="row"><div class="k">No Nota</div><div class="v"><%= (nota==null?"-":nota) %></div></div>
        <div class="row"><div class="k">Pelanggan</div><div class="v"><%= (customer==null?"-":customer) %></div></div>
        <div class="row"><div class="k">Status</div><div class="v"><%= (status==null?"-":status) %></div></div>

        <div class="line"></div>

        <div class="row"><div class="k">Total</div><div class="v"><%= rupiah.format(total) %></div></div>
        <div class="row"><div class="k">Bayar</div><div class="v"><%= rupiah.format(paid) %></div></div>
        <div class="row"><div class="k">Kembalian</div><div class="v"><%= rupiah.format(change) %></div></div>
        <div class="row"><div class="k">Metode</div><div class="v"><%= (method==null?"-":method) %></div></div>
        <div class="row"><div class="k">Penerima</div><div class="v"><%= (receiver==null?"-":receiver) %></div></div>

        <div class="line"></div>
        <div class="footer">Terima kasih 🙏</div>
    </div>
</div>
</body>
</html>
