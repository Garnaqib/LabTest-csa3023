<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Session</title>
    <style>
        .container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #2c3e50;
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background: #3498db;
            color: white;
            border: none;
            padding: 12px;
            font-size: 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background: #2980b9;
        }
        .nav-links {
            text-align: center;
            margin-top: 20px;
        }
        .nav-links a {
            margin: 0 10px;
            color: #3498db;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <%@ include file="header.html" %>
    
    <div class="container">
        <h2>📝 Book a Session</h2>
        
        <form method="POST" action="BookSessionServlet">
            <div class="form-group">
                <label>Student Name:</label>
                <input type="text" name="student_name" required>
            </div>
            
            <div class="form-group">
                <label>Branch Location:</label>
                <select name="branch_location" required>
                    <option value="">Select Branch</option>
                    <option value="Kuala Lumpur">Kuala Lumpur</option>
                    <option value="Penang">Penang</option>
                    <option value="Johor">Johor</option>
                </select>
            </div>
            
            <div class="form-group">
                <label>Lesson Type:</label>
                <select name="lesson_type" required>
                    <option value="">Select Lesson</option>
                    <option value="Manual Car">Manual Car</option>
                    <option value="Automatic Car">Automatic Car</option>
                    <option value="Motorcycle">Motorcycle</option>
                </select>
            </div>
            
            <div class="form-group">
                <input type="submit" value="Book Now">
            </div>
        </form>
        
        <div class="nav-links">
            <a href="index.jsp">Home</a>
            <a href="ScheduleServlet">View Schedule</a>
        </div>
    </div>
    
    <%@ include file="footer.jsp" %>
</body>
</html>