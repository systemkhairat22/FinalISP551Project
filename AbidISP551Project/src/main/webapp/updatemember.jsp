<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Member</title>
</head>
<body>
<a href="ListMemberController">List Of Member</a><br><br>
	
	<form action="UpdateMemberController" method="post">
		Member IC Number: <br>
		<input type="text" name="mem_icnum" value="<c:out value="${m.mem_icnum}"/>"/><br>
		Member Name: <br>
		<input type="text" name="mem_name" value="<c:out value="${m.mem_name}"/>"/><br>
		Member Age: <br>
		<input type="number" name="mem_age" value="<c:out value="${m.mem_age}"/>"/><br>
		Member Address: <br>
		<input type="text" name="mem_address" value="<c:out value="${m.mem_address}"/>"/><br>
		Member Email: <br>
		<input type="text" name="mem_email" value="<c:out value="${m.mem_email}"/>"/><br>
		Member Phone Number: <br>
		<input type="text" name="mem_phonenum" value="<c:out value="${m.mem_phonenum}"/>"/><br>
		Password: <br>
		<input type="password" name="mem_password" value="<c:out value="${m.mem_password}"/>"/><br>
		Representative Name: <br>
		<input type="text" name="repname" value="<c:out value="${m.repname}"/>"/><br>
		Representative Number: <br>
		<input type="text" name="repnum" value="<c:out value="${m.repnum}"/>"/>
		<input type="hidden" name="memberid" value="<c:out value="${m.memberid}"/>"/><br><br>
		
		<input type="submit" value="Submit"/>
		<input type="reset" value="Reset"/>
	</form>

</body>
</html>