package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Vote extends HttpServlet {
	public static final String DBURL = "jdbc:oracle:thin:@localhost:1521:XE";
	public static final String DBUSER = "root";
	public static final String DBPASS = "root";
	public Connection conn = null;

	public Vote() throws SQLException {
		// Load Oracle JDBC Driver
		DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
		// Connect to Oracle Database
		conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("JGHSGHGHGHg");
		String area = req.getSession().getAttribute("area").toString();
		String party = req.getParameter("vote").toString().toUpperCase();
		System.out.println("area:" + area + " party:" + party);

		ResultSet rs = null;
		String query = "SELECT VOTES FROM " + area + " WHERE PARTY='" + party + "'";
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			rs = preparedStatement.executeQuery();
			int initial_votes = 0;
			while (rs.next()) {
				initial_votes = rs.getInt("votes");
				System.out.println("Initial Votes:" + initial_votes);
			}
			int final_vote = initial_votes + 1;
			
            String email=req.getSession().getAttribute("email").toString();
			String query1 = "UPDATE " + area + " SET VOTES='" + final_vote + "' WHERE PARTY='" + party + "'";
			String query2="UPDATE VOTERS SET VOTED='1' WHERE EMAIL='"+email+"'";
			preparedStatement = conn.prepareStatement(query1);
			PreparedStatement preparedStatement2 = conn.prepareStatement(query2);
			HttpSession session=req.getSession();
			try {
				preparedStatement.execute();
				preparedStatement2.execute();
				session.setAttribute("voted","1");
		
			} catch (Exception e) {
				System.out.println(e.getMessage());
				session.setAttribute("voted","0");
		
			}

		} catch (SQLException e) {
			e.printStackTrace();

		}

		RequestDispatcher rd = req.getRequestDispatcher("voter.jsp");
		rd.forward(req, resp);

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("voter.jsp");
		rd.forward(req, resp);
	}
	
	

}
