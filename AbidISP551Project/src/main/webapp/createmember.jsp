<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Create Member</title>
</head>
<body>
	<a href="ListMemberController">LIST MEMBER</a><br>
	<a href = "ViewAdminController2">BACK</a>
	<h1>Create Member</h1><br>
	<form action="CreateMemberController" method="post">
		<table>
			<tbody>
                   <tr>
                       <th><label for="fullname">Full Name</label></th>
                       <th><input type="text"  name="mem_name" placeholder="Full Name"></th>
                   </tr>
                   <tr>
                       <th><label for="memIC">IC Number</label></th>
                       <th><input type="text"  name="mem_icnum" placeholder="000000-00-0000"></th>
                   </tr>
                   <tr>
                       <th><label for="age">Age</label></th>
                       <th><input type="number"  name="mem_age"></th>
                   </tr>
                   
                   <tr>
                       <th><label for="address">Address</label></th>
                       <th><input type="text"  name="mem_address"></th>
                       
                   </tr>
                   <tr>
                       <th><label for="phoneNumber">Phone Number</label></th>
                       <th><input type="text"  name="mem_phonenum" placeholder="000-00000000"></th>
                   </tr>
                   <tr>
                       <th><label for="repName">Representative Name</label></th>
                       <th><input type="text"  name="repname" placeholder=" Representative Full Name"></th>
                   </tr>
                   <tr>
                       <th><label for="repIC">Representative IC Number</label></th>
                       <th><input type="text"  name="repnum" placeholder="000000-00-0000"></th>
                   </tr>
                   <tr>
                       <th><label for="memEmail">Email</label></th>
                       <th><input type="email"  name="mem_email" placeholder="abc@gmail.com"></th>
                   </tr>
                   <tr>
                       <th><label for="memPwd">Password</label></th>
                       <th><input type="password"  name="mem_password"></th>
                   </tr>
                   <tr>
                       <th><label for="memPwd2">Confirm Password</label></th>
                       <th><input type="password"name="mem_password"></th>
                   </tr>
			</tbody>
		</table>
		
		<input  type="submit" value= "submit">
        <input type="reset"  value = "reset">
	</form>
</body>
</html>