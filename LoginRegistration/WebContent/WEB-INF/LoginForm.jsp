<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<script language="JavaScript" type="text/javascript">
	window.history.forward(1);
	function noBack() { window.history.forward(); }
</script>
</head>
<body onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">
	
     <% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0"); %>
	<div align="center">

		<form action="Login" method="post">

			<center>

				<table border="1" width="30%" cellpadding="3">

					<thead>
						<tr>
							<th colspan="2">Login Here</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>User Name :</td>
							<td><input type="text" name="usrname" value=""></td>
						</tr>
						<tr>
							<td>Password :</td>
							<td><input type="password" name="passwrd" value=""></td>
						</tr>
						<tr>
							<td><input type="reset" value="Reset"></td>
							<td><input type="submit" value="Login"></td>
						</tr>
						<tr>
							<td colspan="2">Not Yet Registered!! <a href="RegistrationForm.jsp">Register Here</a> </td>
							</tr>
					</tbody>
				</table>
			</center>
		</form>
	</div>

</body>
</html>