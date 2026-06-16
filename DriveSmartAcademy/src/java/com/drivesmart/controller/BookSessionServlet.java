package com.drivesmart.controller;

import com.drivesmart.model.SessionBean;
import com.drivesmart.dao.SessionDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BookSessionServlet")
public class BookSessionServlet extends HttpServlet {
    
    private SessionDAO dao = new SessionDAO();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get form data
        String name = request.getParameter("student_name");
        String branch = request.getParameter("branch_location");
        String type = request.getParameter("lesson_type");
        
        // Create and set session
        SessionBean session = new SessionBean();
        session.setStudentName(name);
        session.setBranchLocation(branch);
        session.setLessonType(type);
        session.setStatus("Booked");
        
        // Save to database
        dao.bookSession(session);
        
        // Redirect to schedule
        response.sendRedirect("ScheduleServlet");
    }
}