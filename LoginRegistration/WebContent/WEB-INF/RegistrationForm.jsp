<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Registration</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
	%>

	<div>
		<form id="registration_form" method="post" action="Registration">

			<center>
				<table border="1" width="30%" cellpadding="5">
					<thead>
						<tr>
							<th colspan="3">Enter Information Here</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>First Name</td>
							<td width="30%"><input type="text" name="fname" value="" /></td>
							<td width="40%"><span id="fname_error_message"></span></td>
						</tr>
						<tr>
							<td>Last Name</td>
							<td width="30%"><input type="text" name="lname" value="" /></td>
							<td width="40%"><span id="lname_error_message"></span></td>
						</tr>
						<tr>
							<td>Email</td>
							<td width="30%"><input type="text" name="email" value="" /></td>
							<td width="40%"><span id="email_error_message"></span></td>
						</tr>
						<tr>
							<td>User Name</td>
							<td width="30%"><input type="text" name="uname" value="" /></td>
							<td width="40%"><span id="uname_error_message"></span></td>
						</tr>
						<tr>
							<td>Password</td>
							<td width="30%"><input type="password" name="pass" value="" /></td>
							<td width="40%"><span id="password_error_message"></span></td>
						</tr>

						<tr>
							<td>Confirm Password</td>
							<td width="30%"><input type="password" name="conpassword" /></td>
							<td width="40%"><span id="retype_password_error_message"></span></td>
						</tr>

						<tr>
							<td><input type="reset" value="Reset" /></td>
							<td><input type="submit" value="Submit"/></td>
						</tr>
						<tr>
							<td colspan="3">Already registered!! <a href="LoginForm.jsp">Login
									Here</a></td>
						</tr>
					</tbody>
				</table>
			</center>
		</form>
	</div>

	<script type="text/javascript">
		$(function() {

			$("#fname_error_message").show();
			$("#lname_error_message").hide();
			$("#email_error_message").hide();
			$("#uname_error_message").hide();
			$("#password_error_message").hide();
			$("#retype_password_error_message").hide();

			var error_fname = false;
			var error_lname = false;
			var error_email = false;
			var error_uname = false;
			var error_password = false;
			var error_retype_password = false;

			$('[name="fname"]').focusout(function() {
				check_fname();
			});

			$('[name="lname"]').focusout(function() {
				check_lname();
			});
			$('[name="email"]').focusout(function() {
				check_email();
			});
			$('[name="uname"]').focusout(function() {
				check_uname();
			});
			$('[name="pass"]').focusout(function() {
				check_password();
			});
			$('[name="conpassword"]').focusout(function() {
				check_retype_password();
			});

			function check_fname() {

				var pattern = /^[a-zA-Z]*$/
				var fname = $('[name="fname"]').val();
				if (pattern.test(fname) && fname !== '') {
					$("#fname_error_message").hide();
					$('[name="fname"]').css("border-bottom", "2px solid #34F458");
				} else {
					$("#fname_error_message").html(
							"Should contain only Characters");
					$("#fname_error_message").show();
					$('[name="fname"]').css("border-bottom", "2px solid #F90A0A");
					error_fname = true;
				}
			}

			function check_lname() {

				var pattern = /^[a-zA-Z]*$/
				var lname = $('[name="lname"]').val();
				if (pattern.test(lname) && lname !== '') {
					$("#lname_error_message").hide();
					$('[name="lname"]').css("border-bottom", "2px solid #34F458");
				} else {
					$("#lname_error_message").html(
							"Should contain only Characters");
					$("#lname_error_message").show();
					$('[name="lname"]').css("border-bottom", "2px solid #F90A0A");
					error_lname = true;
				}
			}

			function check_uname() {

				var pattern = new RegExp(/^[a-z][\w.-]{4,19}$/i);
				var uname = $('[name="uname"]').val();
				if (pattern.test(uname) && uname !== '') {
					$("#uname_error_message").hide();
					$('[name="uname"]').css("border-bottom", "2px solid #34F458");
				} else {
					$("#uname_error_message").html(
							"Should contain Characters and number");
					$("#uname_error_message").show();
					$('[name="uname"]').css("border-bottom", "2px solid #F90A0A");
					error_uname = true;
				}
			}

			function check_password() {
				var password_length = $('[name="pass"]').val().length;
				if(password_length < 8){
					$("#password_error_message").html("Atleast 8 Characters");
					$("#password_error_message").show();
					$('[name="pass"]').css("border-bottom","2px solid #F90A0A");
			    	error_password = true;
				}else{
					$("#password_error_message").hide();
					$('[name="pass"]').css("border-bottom","2px solid #34F458");
				}
			}
			
			function check_retype_password(){
				var password =$('[name="pass"]').val();
				var retype_password = $('[name="conpassword"]').val();
				if(password !== retype_password){
					$("#retype_password_error_message").html("Passwords does not match");
					$("#retype_password_error_message").show();
					$('[name="conpassword"]').css("border-bottom","2px solid #F90A0A");
					error_retype_password = true;
				}else{
					$("#retype_password_error_message").hide();
					$('[name="conpassword"]').css("border-bottom","2px solid #34F458")
				}
			}
			
			function check_email(){
				var pattern = /^\w+([-+.'][^\s]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
				var email = $('[name="email"]').val();
				if(pattern.test(email) && email !== ''){
					$("#email_error_message").hide();
					$('[name="email"]').css("border-bottom","2px solid #34F458");
				}else{
					$("#email_error_message").html("Invalide Email");
					$("#email_error_message").show();
					$('[name="email"]').css("border-bottom","2px solid #F90A0A");
					error_email = true;
				}	
			}
			
			$("#registration_form").submit(function(){
				error_fname = false;
				error_lname = false;
			    error_email = false;
				error_uname = false;
				error_password = false;
				error_retype_password = false;
				
				check_fname();
				check_sname();
				check_email();
				check_uname();
				check_password();
				check_retype_password();
				
				if(error_fname === false && error_lname === false && error_email === false && error_password === false && 
						error_retype_password === false){
					alert("Registration SuccessFull");
					return true;
				}else{
					alert("Please fill the form Correctly");
					return false;
				}
			});
		});
	</script>
</body>
</html>