<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="../User/partial/top.jsp" %>

    <title>GameVerse - Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/User/assets/styleuserprofile.css">
</head>
<body>
   <%@ include file="../User/partial/middle.jsp" %>
        
        <nav>
            <ul class="nav-menu">
                <li class="nav-item"><a href="${pageContext.request.contextPath}/admin/Adminacc.jsp" class="nav-link active"><i class="fas fa-dashboard"></i> Dashboard</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/admin?action=users" class="nav-link"><i class="fas fa-users-cog"></i> User Management</a></li>
                <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-gamepad"></i> Game library</a></li>
                <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-credit-card"></i> Payment</a></li>
                <li class="nav-item"><a href="#" class="nav-link"><i class="fas fa-star"></i> Reviews</a></li>
           </ul>
        </nav>
        <div class="logout-container">
                <button class="btn" style="background: var(--danger-color);" onclick="confirmLogout()">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </button>
            </div>
    </aside>

    <main class="main-content">
        <div class="dashboard-header">
            <h1 class="section-title">Admin Dashboard</h1>
        </div>

        <!-- Admin Stats Grid -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-title">Total Users</div>
                <div class="stat-value">15,328</div>
            </div>
            <div class="stat-card">
                <div class="stat-title">Active Sessions</div>
                <div class="stat-value">2,415</div>
            </div>
            <div class="stat-card">
                <div class="stat-title">Pending Reports</div>
                <div class="stat-value">47</div>
            </div>
        </div>

        <!-- Recent Activities Section -->
        <h2 class="section-title">Recent Activities</h2>
        <div class="table-container" style="background: var(--card-background); border-radius: 12px; padding: 1rem;">
            <table>
                <thead>
                    <tr>
                        <th>User</th>
                        <th>Action</th>
                        <th>Timestamp</th>
                        <th>IP Address</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <span class="status-indicator status-active"></span>
                            User_Thunder
                        </td>
                        <td>Updated profile</td>
                        <td>2023-08-20 14:30</td>
                        <td>192.168.1.1</td>
                    </tr>
                     <tr>
                <td>
                    <span class="status-indicator status-inactive"></span>
                    User_Kofun
                </td>
                <td>Changed password</td>
                <td>2023-08-21 09:12</td>
                <td>192.168.1.10</td>
            </tr>
            <tr>
                <td>
                    <span class="status-indicator status-active"></span>
                    User_SouthShelf
                </td>
                <td>Logged in</td>
                <td>2023-08-21 10:45</td>
                <td>10.0.0.5</td>
            </tr>
            <tr>
                <td>
                    <span class="status-indicator status-active"></span>
                    User_Haniwa
                </td>
                <td>Deleted account</td>
                <td>2023-08-22 12:01</td>
                <td>172.16.5.4</td>
            </tr>
            <tr>
                <td>
                    <span class="status-indicator status-inactive"></span>
                    User_KingKashyapa
                </td>
                <td>Downloaded game</td>
                <td>2023-08-23 18:20</td>
                <td>192.168.0.77</td>
            </tr>
                    
                </tbody>
            </table>
        </div>

        <!-- System Management -->
        <div class="settings-container" style="margin-top: 2rem;">
            <div style="background: var(--card-background); padding: 2rem; border-radius: 12px;">
                <h2 style="margin-bottom: 1.5rem;">System Controls</h2>
                
                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-title">Server Status</div>
                        <div class="stat-value" style="color: #00ff88;">Online</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-title">Storage Used</div>
                        <div class="stat-value">82%</div>
                    </div>
                </div>

                <div class="danger-zone" style="margin-top: 2rem;">
                    <h3 style="color: var(--danger-color); margin-bottom: 1rem;">
                        <i class="fas fa-exclamation-triangle"></i> Administration Zone
                    </h3>
                    <div style="display: flex; gap: 1rem; flex-wrap: wrap;">
                        <button class="btn" style="background: var(--danger-color);">
                            <i class="fas fa-database"></i> Purge Cache
                        </button>
                        <button class="btn" style="background: var(--danger-color);">
                            <i class="fas fa-user-lock"></i> Lock User
                        </button>
                        <button class="btn" style="background: var(--danger-color);">
                            <i class="fas fa-broadcast-tower"></i> Maintenance Mode
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script>
        // Admin-specific JavaScript
        document.querySelectorAll('.nav-link').forEach(link => {
            link.addEventListener('click', function(e) {
                document.querySelector('.nav-link.active').classList.remove('active');
                this.classList.add('active');
            });
        });
        
        //confirm logout
        function confirmLogout() {
            if (confirm('Are you sure you want to logout?')) {
                localStorage.clear();
                window.location.href = '<%= request.getContextPath() %>/admin?action=logout';

            }
        }


        // Add confirmation for admin actions
        document.querySelectorAll('.danger-zone button').forEach(btn => {
            btn.addEventListener('click', (e) => {
                if(!confirm('Are you sure you want to perform this administrative action?')) {
                    e.preventDefault();
                }
            });
        });
    </script>
</body>
</html>
