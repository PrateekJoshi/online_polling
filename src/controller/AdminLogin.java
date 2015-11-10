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

import model.Admin;
import model.Candidate;

public class AdminLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String admin_email = req.getParameter("admin_email");
		String admin_password = req.getParameter("admin_password");
		try {
			Admin admin = new Admin();
			PrintWriter out = resp.getWriter();
			int result = admin.login_admin(admin_email, admin_password);
			if (result == 1) {
				HttpSession session = req.getSession();
				String admin_name = admin.setAdminDetails(admin_email);
				List<Candidate> wakna_cand=admin.setWaknaCand();
				List<Candidate> solan_cand=admin.setSolanCand();
				List<Candidate> shimla_cand=admin.setShimlaCand();
				List<Candidate> manali_cand=admin.setManaliCand();
				session.setAttribute("email", admin_email);
				session.setAttribute("name", admin_name);
				session.setAttribute("wakna_cand", wakna_cand);
				session.setAttribute("solan_cand", solan_cand);
				session.setAttribute("shimla_cand", shimla_cand);
				session.setAttribute("manali_cand", manali_cand);
				RequestDispatcher rd = req.getRequestDispatcher("admin.jsp");
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

}
