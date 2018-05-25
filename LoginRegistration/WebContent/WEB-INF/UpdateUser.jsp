<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
   response.setHeader("Pragma", "no-cache");
   response.setHeader("Expires", "0"); 
   
   if(session.getAttribute("UserName")==null & session.getAttribute("PassWord")==null){
        	 response.sendRedirect("Login.jsp");
         }%>

	<form method="post" action="UpdateUser" name="fromaddUser">
	
	 <center>
      
		<%
			String action = request.getParameter("action");
		%>
		<%
			if (action.equalsIgnoreCase("edit")) {
		%>
		User Name : <input type="text" name="uname"
			value="<c:out value="${users.uname}" />" readonly="readonly" /> You
		    Can't changer this<br>
		<%
			} else {
		%>
		User Name : <input type="text" name="unmae" value="${users.uname}" />"/>
		<%
			}
		%>
		Password : <input type="text" name="pass"
			value="<c:out value="${users.pword}"/>" /><br> 
		
		Email : <input type="text" name="email" 
		    value="<c:out value="${users.email}"/>" /><br>

		<%
			if (action.equalsIgnoreCase("edit")) {
		%>
		Registration : <input type="text" name="dob"
			value="<fmt:formatDate pattern="yyyy/MM/dd" value="${users.registerDate}"/>"
			readonly="readonly" />You can't change this<br>
		<%
			} else {
		%>
		Registration : <input type="text" name="dob"
			value="<fmt:formatDate pattern="yyyy/MM/dd" value="${users.registerDate}"/>"
			readonly="readonly" />(yyyy/MM/dd)<br />
		<%
			}
		%>
		<input type="submit" value="Submit" />
		
    </center>
    
	</form>
</body>
</html>