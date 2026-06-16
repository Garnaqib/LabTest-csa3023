package com.drivesmart.dao;

import com.drivesmart.model.SessionBean;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SessionDAO {
    
    // CHANGE THIS IF YOUR PASSWORD IS DIFFERENT
    private static final String URL = "jdbc:mysql://localhost:3306/drivesmart_db";
    private static final String USER = "root";
    private static final String PASS = "";  // Change if you have password
    
    // Get connection
    public Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASS);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    // Book session (INSERT)
    public boolean bookSession(SessionBean session) {
        String sql = "INSERT INTO Training_Sessions (student_name, branch_location, lesson_type, status) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, session.getStudentName());
            pstmt.setString(2, session.getBranchLocation());
            pstmt.setString(3, session.getLessonType());
            pstmt.setString(4, session.getStatus());
            
            return pstmt.executeUpdate() > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Get all sessions (SELECT)
    public List<SessionBean> getAllSessions() {
        List<SessionBean> list = new ArrayList<>();
        String sql = "SELECT * FROM Training_Sessions ORDER BY branch_location ASC";
        
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                SessionBean session = new SessionBean();
                session.setSessionId(rs.getInt("session_id"));
                session.setStudentName(rs.getString("student_name"));
                session.setBranchLocation(rs.getString("branch_location"));
                session.setLessonType(rs.getString("lesson_type"));
                session.setStatus(rs.getString("status"));
                list.add(session);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return list;
    }
}