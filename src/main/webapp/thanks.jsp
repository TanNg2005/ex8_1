<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cảm ơn bạn - Email List Application</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 700px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            text-align: center;
        }
        h1 {
            color: #2e7d32;
            font-size: 2.5em;
            margin-bottom: 20px;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .thank-you-message {
            background: linear-gradient(135deg, #e8f5e8, #c8e6c9);
            padding: 25px;
            border-radius: 10px;
            margin: 20px 0;
            border-left: 5px solid #4CAF50;
        }
        .user-info {
            background-color: #f8f9fa;
            border: 2px solid #4CAF50;
            border-radius: 10px;
            padding: 20px;
            margin: 25px 0;
            text-align: left;
        }
        .user-info h2 {
            color: #2e7d32;
            margin: 0 0 15px 0;
            text-align: center;
        }
        .info-row {
            display: flex;
            justify-content: space-between;
            margin: 10px 0;
            padding: 8px 0;
            border-bottom: 1px solid #eee;
        }
        .info-row:last-child {
            border-bottom: none;
        }
        .label {
            font-weight: bold;
            color: #555;
            width: 30%;
        }
        .value {
            color: #333;
            width: 65%;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 15px 40px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            margin: 10px;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s ease;
        }
        .btn:hover {
            background-color: #45a049;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        .btn-secondary {
            background-color: #2196F3;
        }
        .btn-secondary:hover {
            background-color: #1976D2;
        }
        .info-section {
            background: linear-gradient(135deg, #e3f2fd, #bbdefb);
            padding: 20px;
            border-radius: 10px;
            margin: 30px 0;
            border-left: 5px solid #2196F3;
            text-align: left;
        }
        .info-section h3 {
            color: #1565C0;
            margin: 0 0 15px 0;
        }
        .user-list {
            background-color: #fff8e1;
            border-radius: 10px;
            padding: 20px;
            margin: 20px 0;
            border-left: 5px solid #FF9800;
        }
        .user-list h3 {
            color: #F57C00;
            margin: 0 0 15px 0;
            text-align: center;
        }
        .user-item {
            background-color: white;
            border-radius: 8px;
            padding: 15px;
            margin: 10px 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .user-item h4 {
            color: #F57C00;
            margin: 0 0 10px 0;
        }
        .scope-demo {
            background-color: #f3e5f5;
            border-radius: 10px;
            padding: 20px;
            margin: 20px 0;
            border-left: 5px solid #9C27B0;
        }
        .scope-demo h3 {
            color: #7B1FA2;
            margin: 0 0 15px 0;
        }
        .scope-item {
            background-color: white;
            padding: 12px;
            margin: 8px 0;
            border-radius: 5px;
            border: 1px solid #E1BEE7;
        }
        .scope-item strong {
            color: #7B1FA2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🎉 Cảm ơn bạn! 🎉</h1>
        
        <div class="thank-you-message">
            <p style="font-size: 1.2em; margin: 0; color: #2e7d32;">
                Cảm ơn bạn đã tham gia danh sách email của chúng tôi!<br>
                Chúng tôi sẽ liên hệ với bạn sớm nhất có thể.
            </p>
        </div>

        <!-- Display current user information using EL -->
        <c:if test="${not empty user}">
            <div class="user-info">
                <h2>Thông tin đăng ký của bạn</h2>
                <div class="info-row">
                    <span class="label">Họ:</span>
                    <span class="value">${user.firstName}</span>
                </div>
                <div class="info-row">
                    <span class="label">Tên:</span>
                    <span class="value">${user.lastName}</span>
                </div>
                <div class="info-row">
                    <span class="label">Email:</span>
                    <span class="value">${user.email}</span>
                </div>
            </div>
        </c:if>

        <!-- Display current date using EL with explicit scope -->
        <div class="info-section">
            <h3>📅 Thông tin hệ thống</h3>
            <p><strong>Ngày hiện tại:</strong> ${requestScope.currentDate}</p>
            <p><strong>Email hỗ trợ khách hàng:</strong> ${initParam.custServEmail}</p>
            <p><em>Nếu bạn cần hỗ trợ, vui lòng liên hệ qua email hỗ trợ ở trên.</em></p>
        </div>

        <!-- Display first two users from session ArrayList using EL -->
        <c:if test="${not empty sessionScope.users}">
            <div class="user-list">
                <h3>👥 Hai người dùng đầu tiên trong danh sách</h3>
                
                <!-- First user -->
                <c:if test="${not empty sessionScope.users[0]}">
                    <div class="user-item">
                        <h4>🥇 Người dùng đầu tiên</h4>
                        <div class="info-row">
                            <span class="label">Họ và tên:</span>
                            <span class="value">${sessionScope.users[0].firstName} ${sessionScope.users[0].lastName}</span>
                        </div>
                        <div class="info-row">
                            <span class="label">Email:</span>
                            <span class="value">${sessionScope.users[0].email}</span>
                        </div>
                    </div>
                </c:if>

                <!-- Second user -->
                <c:if test="${not empty sessionScope.users[1]}">
                    <div class="user-item">
                        <h4>🥈 Người dùng thứ hai</h4>
                        <div class="info-row">
                            <span class="label">Họ và tên:</span>
                            <span class="value">${sessionScope.users[1].firstName} ${sessionScope.users[1].lastName}</span>
                        </div>
                        <div class="info-row">
                            <span class="label">Email:</span>
                            <span class="value">${sessionScope.users[1].email}</span>
                        </div>
                    </div>
                </c:if>
                
                <c:if test="${empty sessionScope.users[1]}">
                    <p style="text-align: center; color: #666; font-style: italic;">
                        Chỉ có một người dùng trong danh sách hiện tại.
                    </p>
                </c:if>
            </div>
        </c:if>

        <!-- Navigation buttons -->
        <div style="margin-top: 30px;">
            <form action="<c:url value='/emailList' />" method="post" style="display: inline;">
                <input type="hidden" name="action" value="return">
                <button type="submit" class="btn">📋 Xem danh sách đầy đủ</button>
            </form>
            
            <form action="<c:url value='/emailList' />" method="post" style="display: inline;">
                <input type="hidden" name="action" value="join">
                <button type="submit" class="btn btn-secondary">➕ Thêm người dùng mới</button>
            </form>
        </div>
    </div>
</body>
</html>