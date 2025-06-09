package com.gaming.servlet;

import com.gaming.model.User;
import com.gaming.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/User/register")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Collect form data
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Simple password match check
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            request.getRequestDispatcher("/User/login.jsp").forward(request, response);
            return;
        }

        // Populate User model
        User user = new User();
        user.setFirstname(firstname);
        user.setLastname(lastname);
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(password);
        user.setFileName("default.png"); // default avatar
        user.setRole("user"); // Default role

        // Save user
        boolean success = userService.createUser(user);

        if (success) {
            // Redirect to login page with success message
            request.setAttribute("success", "Registration successful. Please login.");
            request.getRequestDispatcher("/User/login.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Registration failed. Username or email might already be taken.");
            request.getRequestDispatcher("/User/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/User/login.jsp");
    }
}
