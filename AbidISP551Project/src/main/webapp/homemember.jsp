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
<title>Home Member</title>
</head>
<body>
	<a href="ManageProfileMemberController">Manage profile</a><br><br>
	<a href="paymentmethod.jsp">MAKE PAYMENT</a><br>	
	<h1>Member Profile</h1>
	Member ID: <c:out value="${m.memberid}"/> <br>
	Member Name: <c:out value="${m.mem_name}"/> <br>
	Member IC Number: <c:out value="${m.mem_icnum}"/> <br>
	Member Age: <c:out value="${m.mem_age}"/> <br>
	Member Email: <c:out value="${m.mem_email}"/> <br>
	Phone Number: <c:out value="${m.mem_phonenum}"/> <br>
	Member password: <c:out value="${m.mem_password}"/> <br>
	Representative Name: <c:out value="${m.repname}"/> <br>
	Representative Number: <c:out value="${m.repnum}"/> <br>
	
	<button onclick="document.location='LogoutMemberController'">Logout</button>
</body>
</html>