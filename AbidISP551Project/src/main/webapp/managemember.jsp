<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Manage Member Profile</title>
</head>
<body>
	<a href = "ViewMemberController2">BACK</a><br><br>
	<h1>MANAGE PROFILE</h1>
	<form action="ManageProfileMemberController?action=update_profile" method="post">
		<table>
			<tbody>
				<tr>
					<td>MEMBER ID</td>
					<td>${m.memberid}</td>
				</tr>
				<tr>
					<td>NAME</td>
					<td>${m.mem_name}</td>
				</tr>
				<tr>
					<td>IC NUMBER</td>
					<td>${m.mem_icnum}</td>
				</tr>
				<tr>
					<td>AGE</td>
					<td><input type="number" name="mem_age" value="${m.mem_age}"/></td>
				</tr>
				<tr>
					<td>ADRESS</td>
					<td><input type="text" name="mem_address" value="${m.mem_address}"/></td>
				</tr>
				<tr>
					<td>EMAIL</td>
					<td><input type="text" name="mem_email" value="${m.mem_email}"/></td>
				</tr>
				<tr>
					<td>PHONE NUMBER</td>
					<td><input type="text" name="mem_phonenum" value="${m.mem_phonenum}"/></td>
				</tr>
				<tr>
					<td>REPRESENTATIVE NAME</td>
					<td><input type="text" name="repname" value="${m.repname}"/></td>
				</tr>
				<tr>
					<td>REPRESENTATIVE IC NUMBER</td>
					<td><input type="text" name="repnum" value="${m.repnum}"/></td>
				</tr>
				<tr>
					<td><input type="hidden" name="memberid" value="<c:out value="${m.memberid}"/>"/><br><br></td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="Submit"/>
		<input type="reset" value="Reset"/>
	</form>
	
	<h1>CHANGE PASSWORD</h1>
	<form action="ManageProfileMemberController?action=change_pass" method="post">
		<table>
			<tbody>
				<tr>
					<td>
						<p>CURRENT PASSWORD</p>
					</td>
					<td>
						<input type="password" id="current_pass" name="current_pass">
					</td>
				</tr>
				<tr>
					<td>
						<p>ENTER NEW PASSWORD</p>
					</td>
					<td>
						<input type="password" id="new_pass" name="new_pass">
					</td>
				</tr>
				<tr>
					<td>
						<p>RE-ENTER NEW PASSWORD</p>
					</td>
					<td>
						<input type="password" id="confirm_pass" name="confirm_pass">
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" onclick="showPass()">Show Password
					</td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="Submit"/>
	</form>
	
	<script>
      function showPass() {
    	  var x = document.getElementById("current_pass");
    	  var y = document.getElementById("new_pass");
    	  var z = document.getElementById("confirm_pass");
    	  if (x.type === "password") {
    	    x.type = "text";
    	  } 
    	  else {
    	    x.type = "password";
    	  }

    	  if (y.type === "password") {
    	    y.type = "text";
    	  } 
    	  else {
    	    y.type = "password";
    	  }

    	  if (z.type === "password") {
    	    z.type = "text";
    	  } 
    	  else {
    	    z.type = "password";
    	  }
    	}
      
      var check = function() {
    	  if (document.getElementById('new_pass').value == document.getElementById('confirm_pass').value) {
    	    document.getElementById("sub").disabled = false;
    	  } 
    	  else {
    	    document.getElementById("sub").disabled = true;
    	  }
    	}
      
      </script>
</body>
</html>