package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Voter;

public class Register extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String register_name = req.getParameter("register_name").toUpperCase().toString();
		String register_email = req.getParameter("register_email").toString();
		String register_password = cryptWithMD5(req.getParameter("register_password").toString());
		String register_dob = req.getParameter("register_dob").toString();
		String register_gender = req.getParameter("register_gender").toString();
		String[] register_area = req.getParameterValues("register_area");
		
		

		System.out.println(register_name);
		System.out.println(register_email);
		System.out.println(register_password);
		System.out.println(register_dob);
		System.out.println(register_gender);
		System.out.println(register_area[0]);

		try {
			PrintWriter out = resp.getWriter();
			Voter voter = new Voter();
			int result = voter.register_voter(register_name, register_email, register_password, register_dob,
					register_gender, register_area[0]);
			if (result == 1) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Registered Successfully');");
				out.println("location='index.jsp';");
				out.println("</script>");
			} else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Unable to register at this time');");
				out.println("location='index.jsp';");
				out.println("</script>");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static String cryptWithMD5(String pass) {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("MD5");
			byte[] passBytes = pass.getBytes();
			md.reset();
			byte[] digested = md.digest(passBytes);
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < digested.length; i++) {
				sb.append(Integer.toHexString(0xff & digested[i]));
			}
			return sb.toString();
		} catch (NoSuchAlgorithmException ex) {
			System.out.println("cannot convert password to md5");
		}
		return null;

	}

}
