<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách người dùng - Email List Application</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
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
            margin: 25px 0 15px 0;
            border-bottom: 2px solid #eee;
            padding-bottom: 10px;
        }
        .user-card {
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            padding: 15px;
            margin: 10px 0;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        .user-card h3 {
            color: #2e7d32;
            margin: 0 0 10px 0;
        }
        .user-info {
            color: #555;
            margin: 5px 0;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin: 10px 5px 0 0;
            text-decoration: none;
            display: inline-block;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .btn-secondary {
            background-color: #2196F3;
        }
        .btn-secondary:hover {
            background-color: #1976D2;
        }
        .info-section {
            background-color: #e8f4f8;
            padding: 15px;
            border-radius: 5px;
            margin: 20px 0;
            border-left: 4px solid #2196F3;
        }
        .empty-list {
            text-align: center;
            color: #666;
            font-style: italic;
            padding: 40px;
            background-color: #f8f9fa;
            border-radius: 5px;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Danh sách người dùng Email</h1>
        
        <!-- Display current date using EL -->
        <div class="info-section">
            <p><strong>Ngày hiện tại:</strong> ${requestScope.currentDate}</p>
            <p><strong>Email dịch vụ khách hàng:</strong> ${initParam.custServEmail}</p>
        </div>
        
        <h2>Người dùng trong phiên (Session)</h2>
        
        <!-- Display users from session using EL -->
        <c:choose>
            <c:when test="${not empty sessionScope.users}">
                <c:forEach var="sessionUser" items="${sessionScope.users}" varStatus="status">
                    <div class="user-card">
                        <h3>Người dùng #${status.index + 1}</h3>
                        <div class="user-info">
                            <p><strong>Họ:</strong> ${sessionUser.firstName}</p>
                            <p><strong>Tên:</strong> ${sessionUser.lastName}</p>
                            <p><strong>Email:</strong> ${sessionUser.email}</p>
                        </div>
                    </div>
                </c:forEach>
                
                <!-- Display first two users specifically as requested -->
                <h2>Hai người dùng đầu tiên</h2>
                <c:if test="${not empty sessionScope.users[0]}">
                    <div class="user-card" style="border-left: 4px solid #4CAF50;">
                        <h3>Người dùng đầu tiên</h3>
                        <div class="user-info">
                            <p><strong>Họ:</strong> ${sessionScope.users[0].firstName}</p>
                            <p><strong>Tên:</strong> ${sessionScope.users[0].lastName}</p>
                            <p><strong>Email:</strong> ${sessionScope.users[0].email}</p>
                        </div>
                    </div>
                </c:if>
                
                <c:if test="${not empty sessionScope.users[1]}">
                    <div class="user-card" style="border-left: 4px solid #FF9800;">
                        <h3>Người dùng thứ hai</h3>
                        <div class="user-info">
                            <p><strong>Họ:</strong> ${sessionScope.users[1].firstName}</p>
                            <p><strong>Tên:</strong> ${sessionScope.users[1].lastName}</p>
                            <p><strong>Email:</strong> ${sessionScope.users[1].email}</p>
                        </div>
                    </div>
                </c:if>
                
                <c:if test="${empty sessionScope.users[1]}">
                    <div class="info-section">
                        <p><em>Chỉ có một người dùng trong danh sách hiện tại.</em></p>
                    </div>
                </c:if>
            </c:when>
            <c:otherwise>
                <div class="empty-list">
                    <p>Chưa có người dùng nào trong phiên làm việc.</p>
                    <p>Vui lòng đăng ký để thêm người dùng mới.</p>
                </div>
            </c:otherwise>
        </c:choose>
        
        <!-- Current user information if available -->
        <c:if test="${not empty requestScope.user}">
            <h2>Người dùng hiện tại</h2>
            <div class="user-card" style="border-left: 4px solid #E91E63;">
                <h3>Thông tin vừa nhập</h3>
                <div class="user-info">
                    <p><strong>Họ:</strong> ${requestScope.user.firstName}</p>
                    <p><strong>Tên:</strong> ${requestScope.user.lastName}</p>
                    <p><strong>Email:</strong> ${requestScope.user.email}</p>
                </div>
            </div>
        </c:if>
        
        <!-- Navigation buttons -->
        <form action="emailList" method="post" style="display: inline;">
            <input type="hidden" name="action" value="join">
            <button type="submit" class="btn">Thêm người dùng mới</button>
        </form>
        
        <form action="thanks.jsp" method="get" style="display: inline;">
            <button type="submit" class="btn btn-secondary">Đến trang cảm ơn</button>
        </form>
        
        <!-- Information about EL usage -->
        <%--<div class="info-section" style="margin-top: 30px; background-color: #fff3e0; border-left: 4px solid #FF9800;">
            <h3 style="margin-top: 0; color: #F57C00;">Thông tin kỹ thuật</h3>
            <p><strong>Ứng dụng này sử dụng EL (Expression Language):</strong></p>
            <ul style="margin: 10px 0; padding-left: 20px;">
                <li><code>\${requestScope.currentDate}</code> - Ngày từ request scope</li>
                <li><code>\${sessionScope.users}</code> - Danh sách user từ session scope</li>
                <li><code>\${initParam.custServEmail}</code> - Email từ context parameter</li>
                <li><code>\${users[0].firstName}</code> - Truy cập phần tử đầu tiên của collection</li>
                <li><code>\${not empty users}</code> - Kiểm tra collection không rỗng</li>
            </ul>
        </div>--%>
    </div>
</body>
</html>