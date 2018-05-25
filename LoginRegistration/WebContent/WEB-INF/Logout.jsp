<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" type="text/javascript">
	window.history.forward(1);
	function noBack() { window.history.forward(); }
</script>
<title>Logout</title>
</head>
<body onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">
	<%
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Expires", "0");
		response.setDateHeader("Expires", -1);
	%>
	<%
		session.removeAttribute("UserName");
		session.removeAttribute("PassWord");
		session.invalidate();
	%>

	
       <% response.sendRedirect("LoginForm.jsp");%>
	
</body>
</html>