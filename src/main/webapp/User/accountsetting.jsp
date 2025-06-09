<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file= "./partial/top.jsp" %>
    <title>GameVerse - Account Settings</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/User/assets/styleuserprofile.css">
</head>
<body>
    <%@ include file= "./partial/middle.jsp" %>
        <nav>
            <ul class="nav-menu">
                <li class="nav-item"><a href="${pageContext.request.contextPath}/User/Useracc.jsp" class="nav-link"><i class="fas fa-dashboard"></i>  Dashboard</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/User/profilesetting.jsp" class="nav-link"> <i class="fas fa-user-cog"></i>  Profile Settings</a></li>
                <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-gamepad"></i>Games</a></li>
                <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-history"></i>Purchase History</a></li>
                <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-star"></i>Reviews</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/user?action=accountSettings" class="nav-link active"><i class="fas fa-cog"></i>Account Settings</a></li>
            </ul>
        </nav>
    </aside>

    <main class="main-content">
        <div class="settings-container">
            <div style="background: var(--card-background); padding: 2rem; border-radius: 12px;">
                <h2 style="margin-bottom: 2rem;">Account Security</h2>
                
				<form id="accountForm" action="${pageContext.request.contextPath}/user?action=updateAccount" method="post"> 
				
	                <div class="form-group">
	                    <label class="form-label">Email Address</label>
	                    <input type="email" class="form-control" name="email" value="${user.email}">
	                </div>
	
	                <div class="form-group">
	                    <label class="form-label">New Password</label>
	                    <input type="password" class="form-control" name="password" placeholder="••••••••">
	                </div>
	
	                <div class="form-group">
	                    <label class="form-label">Confirm Password</label>
	                    <input type="password" class="form-control" name="confirmpassword" placeholder="••••••••">
	                </div>
	                
	
	                <div class="form-group">
	                    <button type="submit" class="btn btn-primary">Update Account</button>
	                </div>
	                </form> 
	          
					<!-- SUCCESS MESSAGE -->
						<c:if test="${not empty sessionScope.successMessage}">
						    <div class="success-message" id="successMessage">
						        ${sessionScope.successMessage}
						    </div>
						    <c:remove var="successMessage" scope="session" />
						</c:if>


						
						<!-- ERROR MESSAGE -->
						<c:if test="${not empty sessionScope.errorMessage}">
						    <div class="error-message" id="errorMessage">
						        ${sessionScope.errorMessage}
						    </div>
						    <c:remove var="errorMessage" scope="session" />
						</c:if>
 
                

                <div class="danger-zone" style="background: rgba(255, 68, 68, 0.05); border: 2px solid var(--danger-color); border-radius: 12px; padding: 1.5rem; margin-top: 3rem;">
                    <h3 style="color: var(--danger-color); margin-bottom: 1.5rem;"><i class="fas fa-exclamation-triangle"></i> Danger Zone</h3>
                    <div style="display: flex; gap: 1rem;">
                        <button class="btn" style="background: var(--danger-color);" onclick="confirmLogout()">
                            <i class="fas fa-sign-out-alt"></i> Logout
                        </button>
                        <button class="btn" style="background: var(--danger-color);" onclick="confirmDelete()">
                            <i class="fas fa-trash"></i> Delete Account
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        // Password Update Handling
        const form = document.getElementById('accountForm');
        const updatePasswordBtn = document.querySelector('.btn-primary');
        
      /*  updatePasswordBtn.addEventListener('click', function(e) {
            
            const passwordInputs = document.querySelectorAll('input[type="password"]');
            const newPassword = passwordInputs[0].value;
            const confirmPassword = passwordInputs[1].value;

            // Basic validation
            if (!newPassword || !confirmPassword) {
            	e.preventDefault();
                alert('Please fill in both password fields');
                return;
            }

            if (newPassword !== confirmPassword) {
            	e.preventDefault();
                alert('Passwords do not match!');
                return;
            }

            if (newPassword.length < 8) {
            	e.preventDefault();
                alert('Password must be at least 8 characters');
                return;
            }

            alert('Password updated successfully!');
        });*/
        const errorDiv = document.getElementById("errorMessage");
        if (errorDiv) {
            // Ensure it is displayed
            errorDiv.style.display = 'block';
            // Auto-hide after 3 seconds
            setTimeout(() => {
                errorDiv.style.display = 'none';
            }, 3000);
        }
        
        const successDiv = document.getElementById("successMessage");
        if (successDiv) {
            successDiv.style.display = 'block';
            setTimeout(() => {
                successDiv.style.display = 'none';
            }, 3000);
        }
    });

        function confirmLogout() {
            if (confirm('Are you sure you want to logout all devices?')) {
                localStorage.clear();
                window.location.href = '<%= request.getContextPath() %>/user?action=logout';

            }
        }

        function confirmDelete() {
            const confirm1 = confirm('This will permanently delete your account! Continue?');
            if (confirm1) {
                const confirm2 = prompt('Type "DELETE" to confirm:');
                if (confirm2 === 'DELETE') {
                    localStorage.clear();
                    window.location.href = '<%= request.getContextPath() %>/user?action=delete';
                }
            }
        }
    

    </script>
</body>
</html>