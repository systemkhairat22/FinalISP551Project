<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%//prevent Caching of JSP Pages
 response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
//get session and check if session null, go to login page
if(session.getAttribute("currentSessionUser")==null)
	response.sendRedirect("index.html");%>
<%int id = (Integer) session.getAttribute("currentSessionUser");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Supervisor home</title>
</head>
<body>
	<h1>Supervisor Home</h1>
	<a href="createadmin.jsp">CREATE NEW ADMIN</a><br>
    <a href="ListAdminController">LIST ADMIN</a><br>
    <a href="ManageProfileAdminController">MANAGE PROFILE</a><br><br>
    
    <h1>Supervisor Profile</h1>
    Admin ID: <c:out value="${a.adminid}"/> <br>
	Admin Name: <c:out value="${a.add_name}"/> <br>
	Admin IC Number: <c:out value="${a.admin_icnum}"/> <br>
	Admin Age: <c:out value="${a.add_age}"/> <br>
	Admin Email: <c:out value="${a.add_email}"/> <br>
	Phone Number: <c:out value="${a.add_phonenum}"/> <br>
	Admin password: <c:out value="${a.add_password}"/> <br>
	<button onclick="document.location='LogoutAdminController'">Logout</button>
</body>
</html>