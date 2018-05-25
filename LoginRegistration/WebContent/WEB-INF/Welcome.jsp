<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome</title>
</head>
<body>
       <%  response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
           response.setHeader("Pragma", "no-cache");
           response.setHeader("Expires", "0"); %>

<h3>Registration Successful.</h3>
<br>
Please Login here... <a href='LoginForm.jsp'>Go to Login</a>

</body>
</html>