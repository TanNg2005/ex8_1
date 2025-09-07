<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Murach's Java Servlets and JSP</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        h2 {
            color: #666;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 10px;
            border: 2px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }
        input[type="text"]:focus, input[type="email"]:focus {
            border-color: #4CAF50;
            outline: none;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .message {
            color: #d32f2f;
            margin: 15px 0;
            padding: 10px;
            background-color: #ffebee;
            border: 1px solid #ffcdd2;
            border-radius: 5px;
        }
        .user-info {
            background-color: #e8f5e8;
            padding: 15px;
            border-radius: 5px;
            margin: 20px 0;
            border: 1px solid #c8e6c9;
        }
        .user-info h3 {
            margin: 0 0 10px 0;
            color: #2e7d32;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Tham gia danh sách Email của chúng tôi</h1>

        <!-- Hiển thị thông báo lỗi -->
        <c:if test="${not empty message}">
            <div class="message">${message}</div>
        </c:if>

        <!-- Hiển thị thông tin người dùng -->
        <c:if test="${not empty user}">
            <div class="user-info">
                <h3>Thông tin người dùng hiện tại:</h3>
                <p><strong>Họ:</strong> ${user.firstName}</p>
                <p><strong>Tên:</strong> ${user.lastName}</p>
                <p><strong>Email:</strong> ${user.email}</p>
            </div>
        </c:if>

        <h2>Để tham gia danh sách email của chúng tôi, hãy nhập thông tin của bạn bên dưới:</h2>

        <!-- Form đăng ký -->
        <form action="<c:url value='/emailList'/>" method="post">
            <input type="hidden" name="action" value="add">

            <div class="form-group">
                <label for="firstName">Họ:</label>
                <input type="text"
                       name="firstName"
                       id="firstName"
                       value="${user.firstName}"
                       required>
            </div>

            <div class="form-group">
                <label for="lastName">Tên:</label>
                <input type="text"
                       name="lastName"
                       id="lastName"
                       value="${user.lastName}"
                       required>
            </div>

            <div class="form-group">
                <label for="email">Địa chỉ Email:</label>
                <input type="email"
                       name="email"
                       id="email"
                       value="${user.email}"
                       required>
            </div>

            <button type="submit" class="btn">Tham gia ngay</button>
        </form>

        <br>

        <!-- Form quay lại danh sách -->
        <form action="<c:url value='/emailList'/>" method="post">
            <input type="hidden" name="action" value="return">
            <button type="submit" class="btn" style="background-color: #2196F3;">
                Xem danh sách người dùng
            </button>
        </form>
    </div>
</body>
</html>