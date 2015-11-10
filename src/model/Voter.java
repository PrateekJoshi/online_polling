package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Voter {

	public static final String DBURL = "jdbc:oracle:thin:@localhost:1521:XE";
	public static final String DBUSER = "root";
	public static final String DBPASS = "root";
	public Connection conn = null;

	public Voter() throws SQLException {
		// Load Oracle JDBC Driver
		DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
		// Connect to Oracle Database
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
	}

	public int register_voter(String name, String email, String pwd, String dob, String gender, String area)
			throws SQLException {
		String query = "INSERT INTO voters (ID,NAME,EMAIL,PASSWORD,DOB,GENDER,AREA)" + "VALUES (?,?,?,?,?,?,?)";
		PreparedStatement preparedStatement = conn.prepareStatement(query);
		preparedStatement.setString(1, "");
		preparedStatement.setString(2, name);
		preparedStatement.setString(3, email);
		preparedStatement.setString(4, pwd);
		preparedStatement.setString(5, dob);
		preparedStatement.setString(6, gender);
		preparedStatement.setString(7, area);
		try {
			preparedStatement.execute();
			return 1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
	}

	public int login_voter(String email, String password) throws SQLException {
		ResultSet rs = null;
		String query = "SELECT EMAIL FROM voters WHERE EMAIL=? AND PASSWORD=?";
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

	public String[] setVoterDetails(String email) throws SQLException {
		ResultSet rs = null;
		String query = "SELECT NAME,GENDER,AREA,VOTED FROM voters WHERE EMAIL=?";
		PreparedStatement preparedStatement = conn.prepareStatement(query);
		preparedStatement.setString(1, email);
		rs = preparedStatement.executeQuery();
		rs.next();
		String name = rs.getString(1);
		String gender = rs.getString(2);
		String area = rs.getString(3);
		String voted = rs.getString(4);
		System.out.println(name + " " + gender + " " + area+" "+voted);
		String[] details = { name, gender, area ,voted};
		return details;
	}

	public List<Candidate> getCandidates(String area) throws SQLException {
		ResultSet rs = null;
		String query = "SELECT NAME,PARTY FROM " + area + "";
		PreparedStatement preparedStatement = conn.prepareStatement(query);
		rs = preparedStatement.executeQuery();

		List<Candidate> candidate_list = new ArrayList<Candidate>();

		while (rs.next()) {
			Candidate cand=new Candidate();
			cand.setName(rs.getString(1));
			cand.setParty(rs.getString(2));
			candidate_list.add(cand);
			System.out.println(rs.getString(1)+" "+ rs.getString(2));
		}
		return candidate_list;
	}
}

