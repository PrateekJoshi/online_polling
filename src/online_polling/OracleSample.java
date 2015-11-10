package online_polling;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OracleSample extends HttpServlet {

	public static final String DBURL = "jdbc:oracle:thin:@localhost:1521:XE";
	public static final String DBUSER = "root";
	public static final String DBPASS = "root";

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
		try {
			// Load Oracle JDBC Driver
			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());

			// Connect to Oracle Database
			Connection con = DriverManager.getConnection(DBURL, DBUSER, DBPASS);

			if (con != null) {
				System.out.println("Connected");
				resp.sendRedirect("index.jsp");
			} else {
				resp.sendRedirect("index2.html");
			}
			con.close();
		} catch (Exception e) {
             System.out.println("Exception "+e.getMessage());
		}
		
	}

}