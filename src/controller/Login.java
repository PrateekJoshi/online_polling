package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Candidate;
import model.Voter;

public class Login extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String login_email = req.getParameter("login_email");
		String login_password = req.getParameter("login_password");
		try {
			Voter voter = new Voter();
			PrintWriter out = resp.getWriter();
			int result = voter.login_voter(login_email, login_password);
			if (result == 1) {
				HttpSession session = req.getSession();
				String[] details = voter.setVoterDetails(login_email);
				session.setAttribute("email", login_email);
				session.setAttribute("name", details[0]);
				session.setAttribute("gender", details[1]);
				session.setAttribute("area", details[2]);
				session.setAttribute("voted", details[3]);
				List<Candidate> area_candidates = voter.getCandidates(details[2]);
				session.setAttribute("area_candidates", area_candidates);

				RequestDispatcher rd = req.getRequestDispatcher("voter.jsp");
				rd.forward(req, resp);
			} else {
				System.out.println("Wong email or password");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Wrong email or password');");
				out.println("location='index.jsp';");
				out.println("</script>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("voter.jsp");
		rd.forward(req, resp);
	}

}
