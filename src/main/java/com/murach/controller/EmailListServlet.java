package com.murach.controller;

import com.murach.data.UserDB;
import com.murach.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

/**
 * EmailListServlet handles email list registration requests
 * Demonstrates the use of request, session, and application attributes
 * for use with EL (Expression Language) in JSP pages
 */
public class EmailListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Set response content type
        response.setContentType("text/html;charset=UTF-8");
        
        // Set request and response encoding
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        // Get current date and set it as request attribute for EL usage
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MMMM dd, yyyy");
        String formattedDate = currentDate.format(formatter);
        request.setAttribute("currentDate", formattedDate);

        // Get session and ensure users list exists
        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        ArrayList<User> users = (ArrayList<User>) session.getAttribute("users");
        if (users == null) {
            users = new ArrayList<>(UserDB.selectAll());
            session.setAttribute("users", users);
        }

        String url = "/index.jsp";
        
        // Get action parameter
        String action = request.getParameter("action");
        if (action == null) {
            action = "join";  // default action
        }

        // Process the action
        if (action.equals("join")) {
            url = "/index.jsp";    // show the join form
        }
        else if (action.equals("add")) {
            // Get parameters from the request
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");

            // Store data in User object and validate
            User user = new User(firstName, lastName, email);
            String message = "";
            
            if (firstName == null || firstName.isEmpty() ||
                lastName == null || lastName.isEmpty() ||
                email == null || email.isEmpty()) {
                message = "Hãy điền thông tin chính xác!";
                url = "/index.jsp";
            } 
            else if (!isValidEmail(email)) {
                message = "Hãy điền thông tin email hợp lệ!";
                url = "/index.jsp";
            }
            else {
                // Add user to database and session
                UserDB.insert(user);
                users.add(0, user); // Add to beginning of list
                if (users.size() > 10) { // Keep only last 10 users in session
                    users.remove(users.size() - 1);
                }
                session.setAttribute("users", users);
                
                // Set user as request attribute for immediate use
                request.setAttribute("user", user);
                url = "/thanks.jsp";
            }
            request.setAttribute("message", message);
            request.setAttribute("user", user);
        }
        else if (action.equals("return")) {
            url = "/ex8_1.jsp";
        }

        // Forward request and response objects to JSP
        RequestDispatcher dispatcher = 
            getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
    
    /**
     * Simple email validation method
     * @param email Email string to validate
     * @return true if email appears valid, false otherwise
     */
    private boolean isValidEmail(String email) {
        return email != null && email.contains("@") && email.contains(".") 
               && email.indexOf("@") < email.lastIndexOf(".");
    }
}