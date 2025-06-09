package com.gaming.servlet;

import com.gaming.model.User;
import com.gaming.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);

        // Check for admin session
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("User/login.jsp");
            return;
        }

        User adminUser = (User) session.getAttribute("user");
        
        System.out.println("AdminServlet accessed by: " + adminUser.getUsername() + " with role: " + adminUser.getRole());


        if (!"admin".equalsIgnoreCase(adminUser.getRole())) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Access denied.");
            return;
        }

        switch (action != null ? action : "dashboard") {
            case "dashboard":
                request.getRequestDispatcher("admin/Adminacc.jsp").forward(request, response);
                break;

            case "users":
                List<User> userList = userService.getAllUsers();
                request.setAttribute("users", userList);
                request.getRequestDispatcher("admin/UserManage.jsp").forward(request, response);
                break;

            case "logout":
                session.invalidate();
                response.sendRedirect("User/login.jsp");
                break;
                
            case "delete":
                int userId = Integer.parseInt(request.getParameter("id"));
                userService.deleteUser(userId);
                response.sendRedirect("admin?action=users");
                break;



            default:
                response.sendRedirect("admin?action=dashboard");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("User/login.jsp");
            return;
        }

        User adminUser = (User) session.getAttribute("user");

        if (!"admin".equalsIgnoreCase(adminUser.getRole())) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Access denied.");
            return;
        }
/*
        switch (action) {
            case "purgeCache":
                System.out.println("Admin purged cache");
                break;

            case "lockUser":
                try {
                    int userId = Integer.parseInt(request.getParameter("userId"));
                    User user = userService.getUserById(userId);
                    if (user != null) {
                        user.setLocked(true);  // Ensure `setLocked()` exists in your User model
                        userService.updateUser(user);
                        System.out.println("User " + user.getUsername() + " locked.");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;

            case "maintenanceMode":
                System.out.println("System put into maintenance mode.");
                break;

            default:
                break;
        }*/

        response.sendRedirect("admin?action=dashboard");
    }
}
