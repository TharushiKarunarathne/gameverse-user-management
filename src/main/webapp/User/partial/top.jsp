<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
		String firstName = (String) session.getAttribute("firstname");
	    String lastName = (String) session.getAttribute("lastname");
	    String userName = (String) session.getAttribute("username");
		 String picture = (String) session.getAttribute("fileName");
					    
					%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">