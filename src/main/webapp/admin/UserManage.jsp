<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<%@ include file="../User/partial/top.jsp" %>
    <title>GameVerse - User Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/User/assets/styleuserprofile.css">
</head>
<body>
   <%@ include file="../User/partial/middle.jsp" %>
        
         <nav>
            <ul class="nav-menu">
                <li class="nav-item"><a href="${pageContext.request.contextPath}/admin/Adminacc.jsp" class="nav-link "><i class="fas fa-dashboard"></i> Dashboard</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/admin?action=users" class="nav-link active"><i class="fas fa-users-cog"></i> User Management</a></li>
                <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-gamepad"></i> Game library</a></li>
                <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-credit-card"></i> Payment</a></li>
                <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-star"></i> Reviews</a></li>
                
        </nav>
    </aside>
   
    
    <main class="main-content">
        <div class="dashboard-header">
            <h1 class="section-title"><u>User Details</u></h1>
        </div>

        <div class="table-container">
            <table class="user-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Picture</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${users}">
            <tr>
    <td>${user.id}</td>
    <td><img src="${pageContext.request.contextPath}/User/assets/${user.fileName}" width="50" height="50" /></td>
    <td>${user.firstname}</td>
    <td>${user.lastname}</td>
    <td>${user.username}</td>
    <td>${user.email}</td>
    <td>
        <!-- Optional: Add Edit/Delete buttons -->
        <button class="btn-icon delete" data-id="${user.id}">
                <i class="fas fa-trash"></i>
          </button>
    </td>
</tr>

        </c:forEach>
                    <!-- More rows -->
                </tbody>
            </table>
        </div>
    </main>

    <script>
        // Delete Confirmation
        document.querySelectorAll('.delete').forEach(btn => {
            btn.addEventListener('click', (e) => {
            	const userId = btn.getAttribute('data-id');
                if(confirm('Are you sure you want to delete this user?')) {
                    // Add your delete logic here
                    window.location.href = 'admin?action=delete&id=' + userId;
                    e.target.closest('tr').remove();
                }
            });
        });
    </script>
</body>
</html>