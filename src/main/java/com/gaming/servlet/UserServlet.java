package com.gaming.servlet;

import com.gaming.model.User;
import com.gaming.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet("/user")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
        maxFileSize = 1024 * 1024 * 10,               // 10MB
        maxRequestSize = 1024 * 1024 * 50)            // 50MB
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    private String handlePhotoUpload(Part filePart, String uploadDirectory) throws IOException {
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + File.separator + uploadDirectory;

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            filePart.write(uploadPath + File.separator + fileName);
            return fileName;
        }
        return null;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("User/login.jsp");
            return;
        }

        User sessionUser = (User) session.getAttribute("user");

        switch (action != null ? action : "") {
            case "logout":
                session.invalidate();
                response.sendRedirect("User/login.jsp");
                break;

            case "delete":
                if (userService.deleteUser(sessionUser.getId())) {
                    session.invalidate();
                    response.sendRedirect("User/login.jsp");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                }
                break;
                
            case "profileSettings":
                request.setAttribute("user", sessionUser);
                request.getRequestDispatcher("User/profilesetting.jsp").forward(request, response);
                break;
                
            case "accountSettings":
                request.setAttribute("user", sessionUser);
                request.getRequestDispatcher("User/accountsetting.jsp").forward(request, response);
                break;



            default:
                request.setAttribute("user", sessionUser);
                request.getRequestDispatcher("User/Useracc.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);
        User sessionUser = (User) (session != null ? session.getAttribute("user") : null);

        if (action == null || sessionUser == null) {
            response.sendRedirect("User/login.jsp");
            return;
        }

        switch (action) {
            case "updateProfile": {
                String firstname = request.getParameter("firstname");
                String lastname = request.getParameter("lastname");
                String username = request.getParameter("username");
                Part filePart = request.getPart("fileName");

                String fileName = handlePhotoUpload(filePart, "User/assets");
                
                if (fileName != null) {
                    sessionUser.setFileName(fileName);
                } else {
                    fileName = sessionUser.getFileName(); // Keep existing
                }

                sessionUser.setFirstname(firstname);
                sessionUser.setLastname(lastname);
                sessionUser.setUsername(username);
                if (fileName != null) {
                    sessionUser.setFileName(fileName);
                }

                if (userService.updateUser(sessionUser)) {
                    session.setAttribute("user", sessionUser);
                    request.setAttribute("successMessage", "Profile updated successfully!");
                    request.getRequestDispatcher("User/profilesetting.jsp").forward(request, response); 


                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                }
                break;
            }

            case "updateAccount": {
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String confirmPassword = request.getParameter("confirmpassword");

                /*sessionUser.setEmail(email);
                sessionUser.setPassword(password);*/

                if (!password.equals(confirmPassword)) {
                    session.setAttribute("errorMessage", "Passwords do not match.");
                    response.sendRedirect(request.getContextPath() + "/user?action=accountSettings");
                    return;
                }

                if (password.length() < 8) {
                    session.setAttribute("errorMessage", "Password must be at least 8 characters.");
                    response.sendRedirect(request.getContextPath() + "/user?action=accountSettings");
                    return;
                }

                sessionUser.setEmail(email);
                sessionUser.setPassword(password); 

                if (userService.updateUser(sessionUser)) {
                    session.setAttribute("user", sessionUser);
                    session.setAttribute("successMessage", "Account updated successfully!");
                    request.setAttribute("successMessage", "Account updated successfully!");
                    request.getRequestDispatcher("User/accountsetting.jsp").forward(request, response);




               
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                }
                break;
            }

            case "delete":
                if (userService.deleteUser(sessionUser.getId())) {
                    session.invalidate();
                    response.sendRedirect("User/login.jsp");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                }
                break;

            default:
                response.sendRedirect("User/Useracc.jsp");
                break;
        }
    }
}