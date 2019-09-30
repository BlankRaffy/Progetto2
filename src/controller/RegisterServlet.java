package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UtenteDAO;
import dao.VolontarioDAO;
import model.UserBean;
import model.VolontarioBean;

@SuppressWarnings("serial")
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// all the get parameter
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String telefono = request.getParameter("telefono");
		String email = request.getParameter("email");
		String password = request.getParameter("Password");
		String orario = request.getParameter("Orario");
		String immagine = request.getParameter("immagine");

		if (orario == null) {

			// creazione userbean e funzione di registrazione
			UserBean u = new UserBean(password, nome, telefono, cognome, email);
			UtenteDAO a = new UtenteDAO();
			boolean d = a.registrazioneu(u);
			if (d == true) {
				request.getSession().setAttribute("d", true);
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			} else {
				request.getSession().setAttribute("d", false);
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
				rd.forward(request, response);
			}
		} else {
			VolontarioBean v = new VolontarioBean(immagine, nome, cognome, password, email, telefono, orario);
			VolontarioDAO vd = new VolontarioDAO();
			boolean c = vd.registrazionev(v);
			if (c == true) {
				request.getSession().setAttribute("c", true);
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			} else {
				request.getSession().setAttribute("c", false);
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
				rd.forward(request, response);
			}
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}