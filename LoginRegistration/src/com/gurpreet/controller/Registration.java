package com.gurpreet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gurpreet.dao.UserDao;
import com.gurpreet.model.RegisterUser;

@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDao userdao;
	RegisterUser registeruser;

	public Registration() {
		super();
		userdao = new UserDao();
		registeruser = new RegisterUser();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String forward = "";
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("delete")) {
			String userId = request.getParameter("userID");
			System.out.println(userId);
			userdao.deleteUser(userId);
			forward = "/ListUser.jsp";
			request.setAttribute("users", userdao.getAllUsers());

		} else if (action.equalsIgnoreCase("edit")) {
			forward = "/UpdateUser.jsp";
			String userId = request.getParameter("userID");
			RegisterUser user = userdao.getUserById(userId);
			request.setAttribute("users", user);
		} else if (action.equalsIgnoreCase("listuser")) {
			forward = "/ListUser.jsp";
			request.setAttribute("users", userdao.getAllUsers());
		} else {
			forward = "/RegistrationForm.jsp";
		}

		RequestDispatcher rd = request.getRequestDispatcher(forward);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		String firstname = request.getParameter("fname");
		String lastname = request.getParameter("lname");
		String email = request.getParameter("email");
		String username = request.getParameter("uname");
		String password = request.getParameter("pass");
		Date date = new Date(Calendar.getInstance().getTime().getTime());

		if (!(firstname.equals(null) || firstname.equals("")) && !(lastname.equals(null) || lastname.equals(""))
				&& !(email.equals(null) || email.equals("")) && !(username.equals(null) || username.equals(""))
				&& !(password.equals(null) || password.equals(""))) {
			registeruser.setFirst_name(firstname);
			registeruser.setLast_name(lastname);
			registeruser.setEmail(email);
			registeruser.setUname(username);
			registeruser.setPword(password);
			registeruser.setRegisterDate(date);

			userdao.addUser(registeruser);
			response.sendRedirect("Welcome.jsp");
		}else {
			out.print("Form is not filled properly...");
		}
	}

}
