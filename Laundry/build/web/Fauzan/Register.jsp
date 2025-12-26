<%-- 
    Document   : Register
    Created on : Dec 16, 2025, 11:27:53 AM
    Author     : Muhammad Zikra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <style>
        .register-page {
            min-height: 100vh;
            background: linear-gradient(135deg, #0f172a, #020617);
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', sans-serif;
        }

        .register-wrapper {
            width: 100%;
            max-width: 480px;
            padding: 20px;
        }

        .register-card {
            background: #ffffff;
            border-radius: 14px;
            padding: 28px 26px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.35);
        }

        .form-control, .form-select {
            border-radius: 10px;
            padding: 10px 12px;
        }

        .btn-success {
            border-radius: 10px;
            font-weight: 600;
        }
        .password-toggle {
    position: absolute;
    right: 14px;
    top: 50%;
    transform: translateY(-50%);
    color: #6b7280;
    cursor: pointer;
    font-size: 16px;
}
.password-toggle:hover {
    color: #2563eb;
}
.password-wrapper {
    position: relative;
}

/* Supaya teks tidak ketiban icon */
.password-wrapper .form-control {
    padding-right: 42px;
}
    </style>
    </head>
    <body class="register-page">

        <div class="register-wrapper">
            <div class="register-card">

                <h3 class="text-center mb-1">Registration</h3>
                <p class="text-center text-muted mb-4">
                    Create your account
                </p>

                <form action="${pageContext.request.contextPath}/Register" method="post" onsubmit="return validateAdmin()">

                    <div class="row mb-3">
                        <div class="col">
                            <label class="form-label">First Name</label>
                            <input type="text" name="firstname" class="form-control" required>
                        </div>
                        <div class="col">
                            <label class="form-label">Last Name</label>
                            <input type="text" name="lastname" class="form-control" required>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control"
                               placeholder="example@gmail.com" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Phone Number</label>
                        <input type="tel" name="phone" class="form-control"
                               placeholder="08xxxxxxxxxx" pattern="08[0-9]{8,11}" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Password</label>

                        <div class="password-wrapper">
                            <input type="password" class="form-control"
                                   name="password" id="passwordField" required>

                            <span class="password-toggle" onclick="togglePassword()">
                                <i id="eyeIcon" class="fa-solid fa-eye"></i>
                            </span>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label">Role</label>
                        <select name="role" id="roleField" class="form-select" required>
                            <option value="">-- Select Role --</option>
                            <option value="user">User</option>
                            <option value="admin">Admin</option>
                        </select>
                    </div>
                    <div id="adminWarning" class="alert alert-danger d-none">
                        <i class="fa-solid fa-triangle-exclamation me-2"></i>
                        Password admin tidak valid. Anda tidak dapat mendaftar sebagai admin.
                    </div>
                    <div id="registerSuccess" class="alert alert-success d-none">
                        <i class="fa-solid fa-circle-check me-2"></i>
                        Registrasi berhasil! Silakan login.
                    </div>
                    <button class="btn btn-success w-100 py-2">
                        Register
                    </button>
                </form>
                <div>
                    <a href="${pageContext.request.contextPath}/Zikra/Pelanggan.jsp"
                       class="btn btn-primary w-100 py-2 text-center">
                        Langsung Masuk ke Pelanggan
                    </a>
                </div>
                <div>
                    <a href="${pageContext.request.contextPath}/Zikra/Admin.jsp"
                       class="btn btn-primary w-100 py-2 text-center">
                       Langsung Masuk ke Admin
                    </a>
                </div>
                
                <div class="text-center mt-3">
                    <a href="${pageContext.request.contextPath}/Fauzan/Login.jsp" class="fw-bold">Back to Login</a>
                </div>

            </div>
        </div>

        <script>
            function validateAdmin() {
        const role = document.getElementById("roleField").value;
        const password = document.getElementById("passwordField").value;

        const warning = document.getElementById("adminWarning");
        const success = document.getElementById("registerSuccess");

        // Reset state
        warning.classList.add("d-none");
        success.classList.add("d-none");

        // Validasi admin
        if (role === "admin" && password !== "admin123") {
            warning.classList.remove("d-none"); // tampilkan error
            return false; // cegah submit
        }

        // Jika lolos validasi
        success.classList.remove("d-none");

        // OPTIONAL: delay submit supaya user lihat pesan sukses
        setTimeout(() => {
            document.querySelector("form").submit();
        }, 2400);

        return false; // cegah submit sementara
    }
            function togglePassword() {
                const input = document.getElementById("passwordField");
                const icon = document.getElementById("eyeIcon");

                if (input.type === "password") {
                    input.type = "text";
                    icon.classList.remove("fa-eye");
                    icon.classList.add("fa-eye-slash");
                } else {
                    input.type = "password";
                    icon.classList.remove("fa-eye-slash");
                    icon.classList.add("fa-eye");
                    }
                }
        </script>
    </body>
</html>
