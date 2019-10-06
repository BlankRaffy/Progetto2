package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserBean;
import dao.UtenteDAO;

@WebServlet("/UtenteCambioPasswordServlet")
public class UtenteCambioPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserBean u = (UserBean) session.getAttribute("utente");
		String email = u.getEmail();
		String oldpassword = request.getParameter("oldpass");
		String newpassword = request.getParameter("newpass");
		UtenteDAO g = new UtenteDAO();
		boolean z = false;
		if (g.verificaOldPassword(email, oldpassword)) {
			z = g.changePassword(email, newpassword);
		}

		request.setAttribute("Changepass", z);
		RequestDispatcher rd = request.getRequestDispatcher("ProfiloUtente.jsp");
		rd.forward(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}