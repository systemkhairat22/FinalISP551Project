<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//prevent Caching of JSP Pages
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
//get session and check if session null, go to login page
if (session.getAttribute("currentSessionUser") == null)
	response.sendRedirect("index.html");
%>
<%int id = (Integer) session.getAttribute("currentSessionUser");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment method </title>
</head>
<body>
	<a href="ViewMemberController2">BACK</a><br>
	<h4>Please select payment method</h4><br>
	
	<button onclick="document.location='OnlinePaymentController'">Online payment</button>
	<button onclick="document.location='CashPaymentController'">Cash payment</button>
</body>
</html>