<%-- 
    Document   : Riwayat_pesanan
    Created on : Dec 16, 2025, 2:42:28 PM
    Author     : Muhammad Zikra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Riwayat_pesanan Page</title>
    </head>
    <body>
        <%
            String currentPage = request.getServletPath();
        %>

        <div class="sidebar">

            <!-- Header -->
            <div class="sidebar-header">
                <h4>User Panel</h4>
                <span>Dashboard</span>
            </div>

            <!-- Menu -->
            <div class="sidebar-menu">
                <a href="${pageContext.request.contextPath}/Zikra/ProfilPelanggan.jsp" class="<%= currentPage.equals("/Zikra/ProfilPelanggan.jsp") ? "active" : "" %>">
                    <i class="fa-solid fa-user"></i>
                    Profil
                </a>

                <a href="${pageContext.request.contextPath}/Ryan/PesananSaya.jsp" class="<%= currentPage.equals("/Ryan/PesananSaya.jsp") ? "active" : "" %>">
                    <i class="fa-solid fa-basket-shopping"></i>
                    Pesanan Saya
                </a>

                <a href="${pageContext.request.contextPath}/Ryan/RiwayatPesanan.jsp" class="<%= currentPage.equals("/Ryan/RiwayatPesanan.jsp") ? "active" : "" %>">
                    <i class="fa-solid fa-clock-rotate-left"></i>
                    Riwayat Pesanan
                </a>
            </div>

            <!-- Footer -->
            <div class="sidebar-footer">
                <a href="${pageContext.request.contextPath}/index.jsp">
                    <i class="fa-solid fa-arrow-right-from-bracket"></i>
                    Logout
                </a>
            </div>
        </div>
        <nav class="navbar navbar-expand-lg" style="margin-left: 240px" >
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Zikra/Pelanggan.jsp">
                        <i class="fa-solid fa-house"></i>
                    </a>
                </div>
            </div>
            <i class="fa-regular fa-bell" style="margin-right: 30px"></i>
            <div class="ms-auto d-flex align-items-center" style="margin-right: 5px">
                <span class="navbar-text me-2">
                    <a class="nav-link d-flex align-items-center gap-2" href="${pageContext.request.contextPath}/Zikra/ProfilPelanggan.jsp">
                        <div class="text-white rounded-circle shadow d-flex justify-content-center align-items-center" style="width: 30px; height: 30px; background-color: #e9ecef; margin-right:10px">
                            <i class="fa-solid fa-user"></i>
                         </div>
                        Zikra
                    </a>
                </span>
            </div>
        </div>
        </nav> 
        <!-- KONTEN UTAMA -->
        <div class="content" style="position: relative; padding-bottom: 80px;">
            <h1 style="color: white; margin-bottom:50px">Halaman History</h1>
            <div class="no-hover">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">
                        Histori Pesanan anda
                    </h4>
                    <div class="table-responsive">
                        <div>
                            <table id="tbl">
                                <thead>
                                    <tr>
                                        <th>Order Code</th>
                                        <th>Tanggal Pemesanan</th>
                                        <th>Tanggal Pengambalian</th>
                                        <th class="right">Total Harga</th>
                                        <th>Status</th>
                                        <th class="right">Nota</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><b>1</b></td>
                                        <td>27-12-2025</td>
                                        <td>27-12-2025</td>
                                        <td>Rp. 50000</td>
                                        <td><span class="badge bg-success" style="color:white">Selesai</span></td>
                                        <td>
                                            <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                                Nota
                                            </button>
                                            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                                    <div class="modal-content modal-white">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="staticBackdropLabel">Nota Kamu</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>NOTA</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td> 
                                        
                                    </tr>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>27-12-2025</td>
                                        <td>27-12-2025</td>
                                        <td>Rp. 50000</td>
                                        <td><span class="badge bg-success" style="color:white">Selesai</span></td>
                                        <td>
                                            <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                                Nota
                                            </button>
                                            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                                    <div class="modal-content modal-white">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="staticBackdropLabel">Nota Kamu</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>NOTA</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td> 
                                        
                                    </tr>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>27-12-2025</td>
                                        <td>27-12-2025</td>
                                        <td>Rp. 50000</td>
                                        <td><span class="badge bg-success" style="color:white">Selesai</span></td>
                                        <td>
                                            <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                                Nota
                                            </button>
                                            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                                    <div class="modal-content modal-white">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="staticBackdropLabel">Nota Kamu</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>NOTA</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td> 
                                        
                                    </tr>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>27-12-2025</td>
                                        <td>27-12-2025</td>
                                        <td>Rp. 50000</td>
                                        <td><span class="badge bg-success" style="color:white">Selesai</span></td>
                                        <td>
                                            <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                                Nota
                                            </button>
                                            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                                    <div class="modal-content modal-white">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="staticBackdropLabel">Nota Kamu</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>NOTA</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td> 
                                        
                                    </tr>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>27-12-2025</td>
                                        <td>27-12-2025</td>
                                        <td>Rp. 50000</td>
                                        <td><span class="badge bg-success" style="color:white">Selesai</span></td>
                                        <td>
                                            <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                                Nota
                                            </button>
                                            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                                    <div class="modal-content modal-white">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="staticBackdropLabel">Nota Kamu</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>NOTA</p>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>                                        
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </body>
</html>
