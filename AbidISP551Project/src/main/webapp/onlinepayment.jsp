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
<title>Online payment</title>
</head>
<body>
	<a href="paymentmethod.jsp">BACK</a><br>
	<h4>Online payment</h4>
	<h4>Please Bank in into</h4>
	<h4>151601767668</h4>
	<h4>Maybank</h4>
	<h4>Masjid Jamek Gelang Patah</h4>
	<form action="OnlinePaymentController" method="post">
		<table>
			<tbody>
				<tr>
					<th><label>Member ID:</label></th>
                    <th><c:out value="${m.memberid}"/></th>
				</tr>
				<tr>
					<th><label>Name:</label></th>
                    <th><c:out value="${m.mem_name}"/></th>
				</tr>
				<tr>
					<th><label>Ic No:</label></th>
                    <th><c:out value="${m.mem_icnum}"/></th>
				</tr>
				<tr>
					<th><label for="payment_date">Payment Date:</label></th>
                    <th><input id="currentDate" type="date"  name="payment_date"></th>
				</tr>
				<tr>
					<th><label>Payment Amount:</label></th>
					<th>
						<select name="payment_amount">
							<option value="5">Monthly Payment (RM5)</option>
							<option value="60">Yearly Payment (RM60)</option>
						</select>
					</th>
				</tr>
				
				<tr>
					<th><label for="payment_receipt">Payment Receipt:</label></th>
					<th><input type="text"  name="payment_receipt"></th>
				</tr>
				
				<tr>
					<th><label for="transactionid">Transaction id:</label></th>
					<th><input type="text"  name="transactionid"></th>
				</tr>
				
				<tr>
					<th><label for="bankname">Bank Name:</label></th>
					<th><input type="text"  name="bankname"></th>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="Submit"/>
		<input type="reset" value="Reset"/>
	</form>
	
	<script>
		//Date purpose
		var date = new Date();
		var currentDate = date.toISOString().slice(0, 10);
		var currentTime = date.getHours() + ':' + date.getMinutes();
		document.getElementById('currentDate').value = currentDate;
	</script>
	
</body>
</html>