<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login error...</title>
</head>
<body>
<center><p style="color:red">Sorry, your your username or password doesn't match.</p></center>
<%
getServletContext().getRequestDispatcher("/LoginForm.jsp").include(request, response);
%>

</body>
</html>