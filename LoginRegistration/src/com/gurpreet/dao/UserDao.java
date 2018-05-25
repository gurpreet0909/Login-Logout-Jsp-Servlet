package com.gurpreet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.gurpreet.model.RegisterUser;
import com.gurpreet.util.DatabaseConnection;

public class UserDao {

	public Connection connection;

	public UserDao() {
		connection = DatabaseConnection.getConnection();
	}

	public String checkUser(RegisterUser user) {

		try {
			PreparedStatement ps = connection.prepareStatement("select uname from registration where uname=?");
			ps.setString(1, user.getUname());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				updateUser(user);
			} else {
				addUser(user);
			}
		} catch (Exception e) {
		}
		return null;
	}

	public void addUser(RegisterUser user) {
		try {
			PreparedStatement ps = connection.prepareStatement(
					"insert into registration(uname,pword,email,regdate,first_name,last_name) values(?,?,?,?,?,?)");
			ps.setString(1, user.getUname());
			ps.setString(2, user.getPword());
			ps.setString(3, user.getEmail());
			ps.setDate(4, new java.sql.Date(user.getRegisterDate().getTime()));
			ps.setString(5, user.getFirst_name());
			ps.setString(6, user.getLast_name());
			ps.executeUpdate();
		} catch (SQLException e) {
		}
	}

	public void updateUser(RegisterUser user) {
		try {
			PreparedStatement ps = connection
					.prepareStatement("update registration set pword=?,email=?"+ "where uname=?");
			ps.setString(1, user.getPword());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getUname());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void deleteUser(String userId) {

		try {
			PreparedStatement ps = connection.prepareStatement("delete from registration where uname=?");
			ps.setString(1, userId);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<RegisterUser> getAllUsers() {

		List<RegisterUser> users = new ArrayList<RegisterUser>();

		try {
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery("select * from registration");
			while (rs.next()) {
				RegisterUser user = new RegisterUser();
				user.setUname(rs.getString("uname"));
				user.setRegisterDate(rs.getDate("regdate"));
				user.setEmail(rs.getString("email"));
				user.setFirst_name(rs.getString("first_name"));
				user.setLast_name(rs.getString("last_name"));
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}

	public RegisterUser getUserById(String userID) {
		RegisterUser user = new RegisterUser();

		try {
			PreparedStatement ps = connection.prepareStatement("select * from registration where uname=?");
			ps.setString(1, userID);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				user.setUname(rs.getString("uname"));
				user.setPword(rs.getString("pword"));
				user.setRegisterDate(rs.getDate("regdate"));
				user.setEmail(rs.getString("email"));
				user.setFirst_name(rs.getString("first_name"));
				user.setLast_name(rs.getString("last_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
}
