<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>

<script>
	function deleteConfirm() {
		return confirm("Are you sure, you want to delete?");
	}
</script>
<script>
	$(document).ready(function() {
		$('#contactTbl').DataTable({
			"pagingType" : "full_numbers"
		});
	});
</script>
</head>
<body>

	<h2>view contacts page</h2>

	<h2>
		<a href="ContactForm"> +Add contacts</a>
	</h2>

	<table  border="1"  id="contactTbl">

		<thead>

			<tr>
				<th>SNO</th>
				<th>ContactName</th>
				<th>ContactEmail</th>
				<th>ContactNumber</th>
				<th>Action</th>
				<th>Created Date</th>
				<th>Updated Date</th>
			</tr>

		</thead>
		<tbody>


			<c:forEach items="${contacts}" var="c" varStatus="index">

				<tr>
					<td>${index.count}</td>
					<td>${c.contactName}</td>
					<td>${c.contactEmail}</td>
					<td>${c.contactNumber}</td>
					<td><a href="editContact?cid=${c.contactId} ">EDIT</a> &nbsp;&nbsp;||&nbsp;<a
						href="deleteContact?cid=${c.contactId}" onclick=" return deleteConfirm()">DELETE</a></td>
					<th>${c.createdDate}</th>
					<th>${c.updatedDate}</th>

				</tr>
			</c:forEach>
		</tbody>


	</table>
	
</body>
</html>