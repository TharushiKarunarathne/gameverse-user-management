<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file= "./partial/top.jsp" %>

    <title>GameVerse - Profile Settings</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/User/assets/styleuserprofile.css">
</head>
<body>
   <%@ include file= "./partial/middle.jsp" %>
        <nav>
            <ul class="nav-menu">
                <li class="nav-item"><a href="${pageContext.request.contextPath}/User/Useracc.jsp" class="nav-link"><i class="fas fa-dashboard"></i>  Dashboard</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/User/profilesetting.jsp" class="nav-link active"> <i class="fas fa-user-cog"></i>  Profile Settings</a></li>
                <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-gamepad"></i>Games</a></li>
                <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-history"></i>Purchase History</a></li>
                <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-star"></i>Reviews</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/User/accountsetting.jsp" class="nav-link "><i class="fas fa-cog"></i>Account Settings</a></li>
            </ul>
        </nav>
    </aside>

    <main class="main-content">
        <div class="settings-container">
            <div class="profile-form" style="background: var(--card-background); padding: 2rem; border-radius: 12px;">
                <h2 style="margin-bottom: 2rem;">Profile Settings</h2>
             <form id="profileForm" action="${pageContext.request.contextPath}/user?action=updateProfile" method="post" enctype="multipart/form-data">   
                <div class="form-group">
                    <label class="form-label">Profile Picture</label>
                    <div style="display: flex; align-items: center; gap: 2rem; margin-bottom: 2rem;">
                        <div style="position: relative; width: 100px; height: 100px; border-radius: 50%; overflow: hidden; border: 2px solid var(--primary-color);">
                            <img src="${pageContext.request.contextPath}/User/assets/${user.fileName}" alt="Profile Preview" id="profilePreview" style="width: 100%; height: 100%; object-fit: cover;">
                            <div style="position: absolute; bottom: 5px; right: 5px; background: rgba(0, 170, 255, 0.9); border-radius: 50%; padding: 0.5rem; cursor: pointer;">
                                <i class="fas fa-camera"></i>
                                <input type="file" name="fileName" id="profileUpload" accept="image/*" hidden>
                            </div>
                        </div>
                        <button type="button" class="btn btn-primary" onclick="document.getElementById('profileUpload').click()">
                            Change Photo
                        </button>
                    </div>
                </div>

                    <div class="form-group">
                        <label class="form-label">First Name</label>
                        <input type="text" class="form-control" id="firstName" name="firstname" value="${user.firstname}" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Last Name</label>
                        <input type="text" class="form-control" id="lastName" name="lastname" value="${user.lastname}" required>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" name="username" value="${user.username}" required>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
                </form>
			<c:if test="${not empty successMessage}">
                <div class="success-message" id="successMessage">
                    ${successMessage}
                </div>
           </c:if>
            </div>
        </div>
    </main>

    <script>
        // Load saved profile data
           
        document.addEventListener('DOMContentLoaded', () => {
            document.getElementById('sidebarUsername').textContent = '${user.username}';
            document.getElementById('sidebarName').textContent = '${user.firstname} ${user.lastname}';
        });


        // Handle profile photo upload
        document.getElementById('profileUpload').addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('profilePreview').src = e.target.result;
                    document.getElementById('sidebarAvatar').src = e.target.result;
                  
                }
                reader.readAsDataURL(file);
            }
        });

    
        
        document.addEventListener("DOMContentLoaded", function () {
            const successDiv = document.getElementById("successMessage");
            if (successDiv) {
                successDiv.style.display = 'block';
                setTimeout(() => {
                    successDiv.style.display = 'none';
                }, 3000);
            }
        });

        function updateSidebarInfo(data) {
            document.getElementById('sidebarUsername').textContent = data.username;
            document.getElementById('sidebarName').textContent = `${data.firstName} ${data.lastName}`;
        }
    </script>
</body>
</html>