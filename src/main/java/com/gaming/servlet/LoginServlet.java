package com.gaming.servlet;

import  com.gaming.model.User;
import  com.gaming.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/User/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String identifier = request.getParameter("username"); // Can be email or username
        String password = request.getParameter("password");

        // Authenticate user
        User user = authenticateUser(identifier, password);
        
        // Check if session already exists
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/user");
            return;
        }

        if (user != null) {
            // Create new session for authenticated user
            session = request.getSession(true);
            session.setAttribute("user", user);
            session.setAttribute("firstname", user.getFirstname());
            session.setAttribute("lastname", user.getLastname());
            session.setAttribute("username", user.getUsername());
            session.setAttribute("fileName", user.getFileName());
            session.setAttribute("role", user.getRole());
            session.setMaxInactiveInterval(30 * 60); // 30 minutes
            
            System.out.println("Redirecting to: " + (user.getRole().equalsIgnoreCase("admin") ? "/admin" : "/user"));

            
         // Redirect based on role
            if ("admin".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect(request.getContextPath() + "/admin?action=dashboard");
            } else {
                response.sendRedirect(request.getContextPath() + "/user");
            }
            
        }else {
            request.setAttribute("error", "Invalid email/username or password");
            request.getRequestDispatcher("/User/login.jsp").forward(request, response);
        }
    }

    private User authenticateUser(String identifier, String password) {
        for (User user : userService.getAllUsers()) {
            if ((user.getEmail().equalsIgnoreCase(identifier) || user.getUsername().equalsIgnoreCase(identifier))
                    && user.getPassword().equals(password)) {
                return user;
            }
        }
        return null;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            if ("admin".equalsIgnoreCase(user.getRole())) {
                response.sendRedirect(request.getContextPath() + "/admin?action=dashboard");
            } else {
                response.sendRedirect(request.getContextPath() + "/user");
            }
        } else {
            request.getRequestDispatcher("/User/login.jsp").forward(request, response);
        }
    }

}

