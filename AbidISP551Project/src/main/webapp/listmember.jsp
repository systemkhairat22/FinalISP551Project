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
<title>View List Member</title>
</head>
<body>
	<a href="createmember.jsp">CREATE MEMBER</a><br><br>
	<a href="ViewAdminController2">BACK</a><br><br>
		<table border="1">
			<tr>
				<th>Member ID</th>
				<th> Name</th>
				<th> IC Number</th>
				<th> Email </th>
				<th> Age</th>
				<th> Address</th>
				<th>Phone Number</th>
				<th>Representative Name</th>
				<th>Representative Number</th>
				<th>Password</th>
				<th colspan="10">Action</th>
			</tr>
			<c:forEach items ="${member}" var="m">
			<tr>
				<td><c:out value="${m.memberid}" /></td>
				<td><c:out value="${m.mem_name}" /></td>
				<td><c:out value="${m.mem_icnum}" /></td>
				
				<td><c:out value="${m.mem_email}" /></td>
				<td><c:out value="${m.mem_age}" /></td>
				<td><c:out value="${m.mem_address}" /></td>
				<td><c:out value="${m.mem_phonenum}" /></td>
				<td><c:out value="${m.repname}" /></td>
			    <td><c:out value="${m.repnum}" /></td>
			    <td><c:out value="${m.mem_password}" /></td>
							
				<td><a class="btn btn-primary" href="ViewMemberController?memberid=<c:out value="${m.memberid}"/>">View</a></td>
				<td><a class="btn btn-primary" href="UpdateMemberController?memberid=<c:out value="${m.memberid}"/>">Update</a></td>
				<td><a class="btn btn-primary" href="DeleteMemberController?memberid=<c:out value="${m.memberid}"/>">Delete</a></td>
				
			</tr>
			</c:forEach>
		</table>
</body>
</html>