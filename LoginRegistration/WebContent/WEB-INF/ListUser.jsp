<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="com.gurpreet.dao.UserDao"%>
<%@ page import="com.gurpreet.model.RegisterUser"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Total Users</title>
<script language="JavaScript" type="text/javascript">
	window.history.forward(1);
	function noBack() { window.history.forward(); }
</script>
</head>
<body onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">
    <% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
       response.setHeader("Pragma", "no-cache");
       response.setHeader("Expires", "0");
       
         if(session.getAttribute("UserName")==null & session.getAttribute("PassWord")==null){
        	 response.sendRedirect("LoginForm.jsp");
         }
         %>
    Welcome <%=session.getAttribute("UserName")%>
	<%
		UserDao userdao = new UserDao();
		List<RegisterUser> getuser= userdao.getAllUsers();
		
	%>
	<br></br>
	<table border=1>
		<thead>
			<tr>
				<th>User Name</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
				<th>Registration Date</th>
				<th colspan=2>Action</th>
			</tr>
		</thead>
		<tbody>
		<c:choose>
		<c:when test="${!empty users}">
		<c:forEach items="${users}" var="user">
				<tr>
					<td><c:out value="${user.uname}" /></td>
					<td><c:out value="${user.first_name}" /></td>
					<td><c:out value="${user.last_name}" /></td>
					<td><c:out value="${user.email}" /></td>
					<td><c:out value="${user.registerDate}"/></td>
					<td><a
						href="Registration?action=edit&userID=<c:out value="${user.uname}"/>">Update</a></td>
					<td><a
						href="Registration?action=delete&userID=<c:out value="${user.uname}"/>">Delete</a></td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise >
		<c:forEach items="${poplulateUserList}" var="user">
				<tr>
					<td><c:out value="${user.uname}" /></td>
					<td><c:out value="${user.first_name}" /></td>
					<td><c:out value="${user.last_name}" /></td>
					<td><c:out value="${user.email}" /></td>
					<td><c:out value="${user.registerDate}"/></td>
					<td><a
						href="Registration?action=edit&userID=<c:out value="${user.uname}"/>">Update</a></td>
					<td><a
						href="Registration?action=delete&userID=<c:out value="${user.uname}"/>">Delete</a></td>
				</tr>
			</c:forEach>
		</c:otherwise>
		</c:choose>
			
		</tbody>
	</table>
	<p>
		<a href="Logout.jsp">Logout</a>
	</p>
	<br>
	<br>

</body>
</html>