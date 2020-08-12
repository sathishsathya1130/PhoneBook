<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<!-- <script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
	
</script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- <script src="C:\Users\Public\jquery-validation-1.19.1\dist/jquery.validate.min.js"></script> -->
<link rel="stylesheet" href="views/style.css" />
<!-- <script src="js/form-validation.js"></script> -->
<script type="text/javascript">

$(function() {
	  $("form[name='registration']").validate({   
	    rules: {
	      contactName: "required",
	      contactNumber:"required",
	     contactEmail: {
	        required: true,
	        email: true
	      },
	      
	    },
	    // Specify validation error messages
	    messages: {
	      contactName:"Please enter your firstname",
	      contactNumber:"Please enter your contactNumber:",
	      contactEmail: "Please enter a valid email address"
	    },
	    submitHandler: function(form) {
	      form.submit();
	    }
	  });
	});



</script>
</head>
<body>
	<div class="container">
		<h1>CONTACT INFO</h1>

		<%-- <h3>${msg}</h3> --%>
		<p>
			<font color="green">${succmsg}</font>
		</p>

		<p>
			<font color="red">${Errmsg}</font>
		</p>


		<form name="registration" action="contactInfo" method="POST">


			<div class="form-group">
				<label for="Contact Name:">Contact Name:</label> <input type="text"
					name="contactName" id="contactName" placeholder="John" />

			</div>


			<div class="form-group">
				<label for="exampleInputEmail1">contactEmail:</label> <input
					type="email" class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp" placeholder="Enter email"> <small
					id="emailHelp" class="form-text text-muted">We'll never
					share your email with anyone else.</small>
			</div>
			<div class="form-group">
				<label for="Contact Number:">Contact Number:</label> <input
					type="number" name="contactNumber" id="contactNumber"
					placeholder="999999999" />

			</div>

			<button type="submit" class="btn btn-primary">addContact</button>
			<div class="footer">
				Links: <a href="viewContacts">View ALL Contacts</a>
			</div>

		</form>
	</div>
</body>
</html>