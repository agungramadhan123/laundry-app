<%-- 
    Document   : Login
    Created on : Dec 16, 2025, 11:23:15 AM
    Author     : Muhammad Zikra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style>
            /* Background */
.login-page {
    min-height: 100vh;
    background: linear-gradient(135deg, #0f172a, #020617);
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: 'Segoe UI', sans-serif;
}

/* Wrapper */
.login-wrapper {
    width: 100%;
    max-width: 420px;
    padding: 20px;
}

/* Card */
.login-card {
    background: #ffffff;
    border-radius: 14px;
    padding: 28px 26px;
    box-shadow: 0 20px 40px rgba(0,0,0,0.35);
}

/* Input */
.login-card .form-control {
    border-radius: 10px;
    padding: 10px 12px;
}

/* Button */
.login-card .btn-primary {
    background: #2563eb;
    border-color: #2563eb;
    border-radius: 10px;
    font-weight: 600;
}

.login-card .btn-primary:hover {
    background: #1d4ed8;
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
    <body class="login-page">

        <div class="login-wrapper">
            <div class="login-card">

                <h3 class="text-center mb-1">Authentication</h3>
                <p class="text-center text-muted mb-4">
                    Please login to access the system
                </p>

                <% if (request.getParameter("error") != null) { %>
                <div class="alert alert-danger text-center py-2">
                    Invalid email or password
                </div>
                <% } %>

                <% if (request.getParameter("registered") != null) { %>
                <div class="alert alert-success text-center py-2">
                    Registration successful
                </div>
                <% }%>

                <form action="Login" method="post">
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" name="Email"
                               placeholder="example@gmail.com" required>
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
                    <div>
                        <button class="btn btn-primary w-100 py-2 text-center"> 
                             Login
                        </button>
                    </div>
                </form>
                <div class="text-center mt-3">
                    <span class="text-muted">Don't have an account?</span><br>
                    <a href="${pageContext.request.contextPath}/Fauzan/Register.jsp" class="fw-bold">Create account</a>
                </div>
            </div>
                <script>
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
        </div>
    </body>
</html>
