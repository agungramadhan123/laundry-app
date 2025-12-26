<%-- 
    Document   : PesananDiprosesAdmin
    Created on : Dec 20, 2025, 3:52:05 PM
    Author     : Muhammad Zikra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
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
        border-bottom: 1px solid rgba(255,255,255,.08);
      }
      .navbar .nav-link, .navbar-text {
        color: #e5e7eb !important;
      }
      .wrap {
        max-width: 1000px;
        margin: 24px auto;
        padding: 0 16px;
      }
      .card {
        background: #111827;
        border: 1px solid rgba(255,255,255,.08);
        border-radius: 12px;
        padding: 16px;
        box-shadow: 0 10px 24px rgba(0,0,0,.35);
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
        border: 1px solid rgba(255,255,255,.12);
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
      th, td {
        padding: 10px;
        border-top: 1px solid rgba(255,255,255,.08);
        text-align: left;
        font-size: 14px;
      }
      th {
        background: rgba(255,255,255,.03);
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
        border: 1px solid rgba(59,130,246,.35);
        background: rgba(59,130,246,.12);
        color: #93c5fd;
      }
      .btn {
        display: inline-block;
        padding: 9px 12px;
        border-radius: 8px;
        text-decoration: none;
        border: 1px solid rgba(255,255,255,.12);
        background: rgba(255,255,255,.04);
        color: #e5e7eb;
        font-weight: 800;
      }
      .btn:hover {
        background: rgba(255,255,255,.07);
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
            <a class="nav-link" href="${pageContext.request.contextPath}/Zikra/Admin.jsp">
              <i class="fa-solid fa-house"></i>
            </a>
          </div>
        </div>
        <i class="fa-regular fa-bell" style="margin-right: 30px"></i>
        <div class="ms-auto d-flex align-items-center" style="margin-right: 5px">
          <span class="navbar-text me-2">
            <a class="nav-link d-flex align-items-center gap-2" href="${pageContext.request.contextPath}/Zikra/ProfilAdmin.jsp">
              <div class="text-white rounded-circle shadow d-flex justify-content-center align-items-center" 
                   style="width: 30px; height: 30px; background-color: #e9ecef; margin-right:10px">
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
      <h1 class="mb-5">Pesanan Diproses!!!!!!!!!!</h1>
      <!-- contoh card -->
      <div class="card">
        <h2>Contoh Card</h2>
        <p>Isi konten card di sini.</p>
      </div>
    </div>
  </body>
</html>
