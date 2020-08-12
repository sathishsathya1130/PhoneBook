<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Info</title>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script>
	$(document).ready(function(e) {
		$("#contactEmail").blur(function(event) {
			$("#dupEmail").html("");
			var emailId = $("#contactEmail").val();
			$.ajax({
				url : 'validateEmail?email=' + emailId,
				success : function(abc) {
					if (abc == 'Duplicate') {
						$("#dupEmail").html("Email already registered");
						$("#contactEmail").focus();
					}
				}
			});
		});
	});
</script>
</head>


<body>


	<h1 align="center">CONTACT INFO</h1>

	<%-- <h3>${msg}</h3> --%>
	<p>
		<font color="green">${succmsg}</font>
	</p>

	<p>
		<font color="red">${Errmsg}</font>
	</p>

	<form:form onsubmit="validate()" action="addContact"
		modelAttribute="contact" method="POST">
		<table>


			<tr>
				<form:hidden path="contactId" />

				<td>Contact Name:</td>

				<td><form:input path="contactName" Id="contactName" /></td>
			</tr>

			<tr>
				<td>Contact Email:</td>
				<td><form:input path="contactEmail" /> <font color='red'>
						
				</font></td>
			</tr>



			<tr>
				<td>Contact Number:</td>

				<td><form:input path="contactNumber" id="contactNumber" /></td>
			</tr>
			<tr>
				<td><input type="reset" value="RESET" /></td>
				<td><input type="submit" value="addContact" /></td>
			</tr>
		</table>
	</form:form>

	<a href="viewContacts">View ALL Contacts</a>
</body>
</html>
