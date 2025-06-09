<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside class="sidebar">
        <div class="profile-section">
            <img id= "sidebarAvatar" src="${pageContext.request.contextPath}/User/assets/${user.fileName}" alt="Sidebar Avatar" class="profile-photo">
            <div id="sidebarUserName"class="username">${user.username}</div>
            <div id="sidebatName"class="full-name">${user.firstname} ${user.lastname}</div>
        
        </div>
