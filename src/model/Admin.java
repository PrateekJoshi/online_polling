package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Admin {
	public static final String DBURL = "jdbc:oracle:thin:@localhost:1521:XE";
	public static final String DBUSER = "root";
	public static final String DBPASS = "root";
	public Connection conn = null;

	public Admin() throws SQLException {
		// Load Oracle JDBC Driver
		DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
		// Connect to Oracle Database
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
	}

	public int login_admin(String email, String password) throws SQLException {
		ResultSet rs = null;
		String query = "SELECT EMAIL FROM admin WHERE EMAIL=? AND PASSWORD=?";
		PreparedStatement preparedStatement = conn.prepareStatement(query);
		preparedStatement.setString(1, email);
		preparedStatement.setString(2, password);
		rs = preparedStatement.executeQuery();
		int count = 0;
		while (rs.next())
			count++;
		System.out.println("Count " + count);
		if (count == 1) {
			return 1;
		} else {
			return 0;
		}
	}

	public String setAdminDetails(String email) throws SQLException {
		ResultSet rs = null;
		String query = "SELECT NAME FROM admin WHERE EMAIL=?";
		PreparedStatement preparedStatement = conn.prepareStatement(query);
		preparedStatement.setString(1, email);
		rs = preparedStatement.executeQuery();
		rs.next();
		String name = rs.getString(1);
		System.out.println("Admin name " + name);
		return name;
	}

	public List<Candidate> setWaknaCand() throws SQLException {
		ResultSet rs = null;
		String query = "SELECT NAME,PARTY,VOTES FROM VAKNAGHAT";
		PreparedStatement preparedStatement = conn.prepareStatement(query);
		rs = preparedStatement.executeQuery();

		List<Candidate> candidate_list = new ArrayList<Candidate>();

		while (rs.next()) {
			Candidate cand = new Candidate();
			cand.setName(rs.getString(1));
			cand.setParty(rs.getString(2));
			cand.setVotes(rs.getInt(3));
			candidate_list.add(cand);
			System.out.println("Name:"+ rs.getString(1) + " Party: " + rs.getString(2) + " Votes: " + rs.getInt(3));
		}
		return candidate_list;
	}

	public List<Candidate> setSolanCand() throws SQLException {
		ResultSet rs = null;
		String query = "SELECT NAME,PARTY,VOTES FROM SOLAN";
		PreparedStatement preparedStatement = conn.prepareStatement(query);
		rs = preparedStatement.executeQuery();

		List<Candidate> candidate_list = new ArrayList<Candidate>();

		while (rs.next()) {
			Candidate cand = new Candidate();
			cand.setName(rs.getString(1));
			cand.setParty(rs.getString(2));
			cand.setVotes(rs.getInt(3));
			candidate_list.add(cand);
			System.out.println(rs.getString(1) + " " + rs.getString(2) + " " + rs.getInt(3));
		}
		return candidate_list;
	}
	
	public List<Candidate> setShimlaCand() throws SQLException {
		ResultSet rs = null;
		String query = "SELECT NAME,PARTY,VOTES FROM SHIMLA";
		PreparedStatement preparedStatement = conn.prepareStatement(query);
		rs = preparedStatement.executeQuery();

		List<Candidate> candidate_list = new ArrayList<Candidate>();

		while (rs.next()) {
			Candidate cand = new Candidate();
			cand.setName(rs.getString(1));
			cand.setParty(rs.getString(2));
			cand.setVotes(rs.getInt(3));
			candidate_list.add(cand);
			System.out.println(rs.getString(1) + " " + rs.getString(2) + " " + rs.getInt(3));
		}
		return candidate_list;
	}
	
	public List<Candidate> setManaliCand() throws SQLException {
		ResultSet rs = null;
		String query = "SELECT NAME,PARTY,VOTES FROM MANALI";
		PreparedStatement preparedStatement = conn.prepareStatement(query);
		rs = preparedStatement.executeQuery();

		List<Candidate> candidate_list = new ArrayList<Candidate>();

		while (rs.next()) {
			Candidate cand = new Candidate();
			cand.setName(rs.getString(1));
			cand.setParty(rs.getString(2));
			cand.setVotes(rs.getInt(3));
			candidate_list.add(cand);
			System.out.println(rs.getString(1) + " " + rs.getString(2) + " " + rs.getInt(3));
		}
		return candidate_list;
	}

}
