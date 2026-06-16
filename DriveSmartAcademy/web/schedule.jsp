<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.drivesmart.model.SessionBean" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Schedule</title>
    <style>
        .container {
            max-width: 900px;
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th {
            background: #2c3e50;
            color: white;
            padding: 12px;
            text-align: left;
        }
        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        tr:hover {
            background: #f5f5f5;
        }
        .status {
            padding: 3px 12px;
            border-radius: 20px;
            color: white;
            font-size: 12px;
        }
        .status-booked {
            background: #3498db;
        }
        .status-completed {
            background: #2ecc71;
        }
        .no-data {
            text-align: center;
            padding: 30px;
            color: #999;
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
        <h2>📊 Training Schedule</h2>
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Student</th>
                    <th>Branch</th>
                    <th>Lesson</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<SessionBean> list = (List<SessionBean>) request.getAttribute("sessionList");
                    if (list != null && !list.isEmpty()) {
                        for (SessionBean s : list) {
                %>
                <tr>
                    <td><%= s.getSessionId() %></td>
                    <td><%= s.getStudentName() %></td>
                    <td><%= s.getBranchLocation() %></td>
                    <td><%= s.getLessonType() %></td>
                    <td>
                        <span class="status <%= s.getStatus().equals("Booked") ? "status-booked" : "status-completed" %>">
                            <%= s.getStatus() %>
                        </span>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5" class="no-data">No sessions found. Book one now!</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        
        <div class="nav-links">
            <a href="index.jsp">Home</a>
            <a href="book_session.jsp">Book Session</a>
        </div>
    </div>
    
    <%@ include file="footer.jsp" %>
</body>
</html>