<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  	
  	<%@ include file= "./partial/top.jsp" %>
  	
    <title>GameVerse - User Dashboard</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/User/assets/styleuserprofile.css">
</head>
<body>
    <!-- Fixed Side Navigation -->
    <%@ include file= "./partial/middle.jsp" %>
    
        <nav>
            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/User/Useracc.jsp" class="nav-link active">
                        <i class="fas fa-dashboard"></i>
                        Dashboard
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/User/profilesetting.jsp" class="nav-link">
                        <i class="fas fa-user-cog"></i> 
                        Profile Settings
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-gamepad"></i>
                        Games
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-history"></i>
                        Purchase History
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-star"></i>
                        Reviews
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/User/accountsetting.jsp" class="nav-link">
                        <i class="fas fa-cog"></i>
                        Account Settings
                    </a>
                </li>
            </ul>
        </nav>
    </aside>
   
    <!-- Main Content -->
    <main class="main-content">
        <div class="dashboard-header">
            <h1 class="section-title">Dashboard Overview</h1>
        </div>

        <!-- Stats Cards -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-title">Total Games</div>
                <div class="stat-value">47</div>
            </div>
            <div class="stat-card">
                <div class="stat-title">Hours Played</div>
                <div class="stat-value">326h</div>
            </div>
            <div class="stat-card">
                <div class="stat-title">Achievements</div>
                <div class="stat-value">23</div>
            </div>
        </div>

        <!-- Recent Games -->
        <h2 class="section-title" style="margin-bottom: 1.5rem;">Recent Games</h2>
        <div class="games-grid">
            <div class="game-card">
                <img src="${pageContext.request.contextPath}/User/assets/download.jpeg" alt="Game Cover" class="game-image">
                <div class="game-info">
                    <div class="game-title">Valorant</div>
                    <div class="game-hours">200+ hours played</div>
                </div>
            </div>
            <div class="game-card">
                <img src="${pageContext.request.contextPath}/User/assets/Forza5.jpg" alt="Game Cover" class="game-image">
                <div class="game-info">
                    <div class="game-title">Forza Horizon 5</div>
                    <div class="game-hours">100+ hours played</div>
                </div>
            </div>
            <div class="game-card">
                <img src="${pageContext.request.contextPath}/User/assets/deltaForce.jpg" alt="Game Cover" class="game-image">
                <div class="game-info">
                    <div class="game-title">Delta Force</div>
                    <div class="game-hours">100+ hours played</div>
                </div>
            </div>
            <div class="game-card">
                <img src="${pageContext.request.contextPath}/User/assets/mine.png" alt="Game Cover" class="game-image">
                <div class="game-info">
                    <div class="game-title">MineCraft</div>
                    <div class="game-hours">200+ hours played</div>
                </div>
            </div>
            <div class="game-card">
                <img src="${pageContext.request.contextPath}/User/assets/halo.jpg" alt="Game Cover" class="game-image">
                <div class="game-info">
                    <div class="game-title">Halo</div>
                    <div class="game-hours">50 hours played</div>
                </div>
            </div>
            
        </div>

        <!-- Achievements -->
        <h2 class="section-title" style="margin: 2rem 0 1.5rem;">Recent Achievements</h2>
        <div class="achievements-grid">
            <div class="achievement-badge">
                <i class="fas fa-trophy"></i>
            </div>
             <div class="achievement-badge">
                <i class="fas fa-medal"></i>
            </div>
            <div class="achievement-badge">
                <i class="fas fa-hourglass-end "></i>
            </div>
            <div class="achievement-badge">
                <i class="fas fa-handshake"></i>
            </div>
        </div>
    </main>

    <script>
    
        // Add active class to clicked nav items
        document.querySelectorAll('.nav-link').forEach(link => {
            link.addEventListener('click', function(e) {
                document.querySelector('.nav-link.active').classList.remove('active');
                this.classList.add('active');
            });
        });
    </script>
</body>
</html>