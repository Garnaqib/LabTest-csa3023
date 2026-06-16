package com.drivesmart.controller;

import com.drivesmart.model.SessionBean;
import com.drivesmart.dao.SessionDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ScheduleServlet")
public class ScheduleServlet extends HttpServlet {
    
    private SessionDAO dao = new SessionDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get all sessions
        List<SessionBean> sessions = dao.getAllSessions();
        
        // Set attribute
        request.setAttribute("sessionList", sessions);
        
        // Forward to JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("schedule.jsp");
        dispatcher.forward(request, response);
    }
}