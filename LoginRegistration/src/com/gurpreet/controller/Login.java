package com.gurpreet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gurpreet.dao.UserDao;
import com.gurpreet.util.DatabaseConnection;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDao userdao;
	String SQL = "select*from registration where uname=? and pword=?";
	Connection connection;
	String userdbname;
	String userdbpassword;

	public Login() {
		userdao = new UserDao();
		connection = DatabaseConnection.getConnection();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String username = request.getParameter("usrname");
		String password = request.getParameter("passwrd");

		if ((!(username.equals(null) || username.equals("")) && !(password.equals(null) || password.equals("")))) {

			try {
				PreparedStatement ps = connection.prepareStatement(SQL);
				ps.setString(1, username);
				ps.setString(2, password);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					userdbname = rs.getString("uname");
					userdbpassword = rs.getString("pword");

					if (username.equalsIgnoreCase(userdbname) && password.equalsIgnoreCase(userdbpassword)) {

						session.setAttribute("UserName", username);
						session.setAttribute("PassWord", password);
						response.sendRedirect("Index.jsp");
					}
				} else {
					response.sendRedirect("Error.jsp");
					rs.close();
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			getServletContext().getRequestDispatcher("/LoginForm.jsp").include(request, response);
			out.println("<html>");
			out.println("<body>");
			out.println("<center>");
			out.println("<p style=\"color:red\">");
			out.println("Sorry, Error in Login.");
			out.println("</p>");
			out.println("</center>");
			out.println("</body>");
			out.println("</html>");

		}
	}
}
