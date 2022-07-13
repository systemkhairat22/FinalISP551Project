<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Admin</title>
</head>
<body>
	
<a href="createadmin.jsp">Create Admin</a><br><br>
<a href="homesupervisor.jsp">Back</a><br><br>
		<table border="1">
			<tr>
				<th>Admin ID</th>
				<th> Name</th>
				<th> IC Number</th>
				<th> Email </th>
				<th> Age</th>
				<th>Phone Number</th>
				<th>Supervisor ID</th>
				<th>Password</th>
				<th colspan="8">Action</th>
			</tr>
			<c:forEach items ="${admin}" var="a" varStatus="admin">
			<tr>
				<td><c:out value="${a.adminid}" /></td>
				<td><c:out value="${a.add_name}" /></td>
				<td><c:out value="${a.admin_icnum}" /></td>
				
				<td><c:out value="${a.add_email}" /></td>
				<td><c:out value="${a.add_age}" /></td>
				<td><c:out value="${a.add_phonenum}" /></td>
				
			    <td><c:out value="${a.supervisorid}" /></td>
			    <td><c:out value="${a.add_password}" /></td>
			   
				<td><a class="btn btn-primary" href="ViewAdminController?adminid=<c:out value="${a.adminid}"/>">View</a></td>
				<td><a class="btn btn-primary" href="UpdateAdminController?adminid=<c:out value="${a.adminid}"/>">Update</a></td>
				<td><a class="btn btn-primary" href="DeleteAdminController?adminid=<c:out value="${a.adminid}"/>">Delete</a></td>
				
			</tr>
			</c:forEach>
		</table>
		
		<!-- <script>
		function confirmation(id) {
			console.log(id);
			var r = confirm("Are you sure you want to delete?");
			if (r == true) {
				location.href = 'deletemembercontroller?memberid=' + id;
				alert("Member successfully deleted");
			} else {
				return false;
			}
		}
		</script> -->	
	
</body>
</html>