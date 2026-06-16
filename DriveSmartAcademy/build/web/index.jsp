<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DriveSmart - Home</title>
    <style>
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
            min-height: 300px;
        }
        .nav-buttons {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin: 40px 0;
        }
        .btn {
            padding: 20px 40px;
            background: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 18px;
            font-weight: bold;
        }
        .btn:hover {
            background: #2980b9;
        }
        .btn.green {
            background: #2ecc71;
        }
        .btn.green:hover {
            background: #27ae60;
        }
        h2 {
            color: #2c3e50;
        }
    </style>
</head>
<body>
    <%@ include file="header.html" %>
    
    <div class="container">
        <h2>Welcome to DriveSmart Academy</h2>
        <p>Select an option below</p>
        
        <div class="nav-buttons">
            <a href="book_session.jsp" class="btn">📝 Book Session</a>
            <a href="ScheduleServlet" class="btn green">📊 View Schedule</a>
        </div>
    </div>
    
    <%@ include file="footer.jsp" %>
</body>
</html>