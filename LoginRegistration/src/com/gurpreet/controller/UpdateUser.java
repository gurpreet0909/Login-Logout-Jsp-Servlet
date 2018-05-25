package com.gurpreet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gurpreet.dao.UserDao;
import com.gurpreet.model.RegisterUser;

@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDao userdao;
	RegisterUser registeruser;
	Date date1;
	PrintWriter out;

	public UpdateUser() {
		super();
		userdao = new UserDao();
		registeruser = new RegisterUser();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	
		out = response.getWriter();

		String username = request.getParameter("uname");
		String email = request.getParameter("email");
		String password = request.getParameter("pass");

		registeruser.setUname(username);
		registeruser.setEmail(email);
		registeruser.setPword(password);

		userdao.updateUser(registeruser);
		request.setAttribute("poplulateUserList", userdao.getAllUsers());
		// response.sendRedirect("Index.jsp");

		getServletContext().getRequestDispatcher("/ListUser.jsp").include(request, response);
		out.println("<html>");
		out.println("<body>");
		out.println("<center>");
		out.println("<p style=\"color:red\">");
		out.println("Your Profile has been updated.");
		out.println("</p>");
		out.println("</center>");
		out.println("</body>");
		out.println("</html>");
		
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
	}

}
