package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.VolontarioDAO;
import model.VolontarioBean;

@WebServlet("/AdminModificaVolontariServlet")
public class AdminModificaVolontariServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VolontarioBean v = new VolontarioBean(request.getParameter("immagine"), request.getParameter("nome"),
				request.getParameter("cognome"), request.getParameter("password"), request.getParameter("email"),
				request.getParameter("telefono"), request.getParameter("orario"));
		VolontarioDAO a = new VolontarioDAO();
		boolean b = a.ModificaVolontari(v);
		

		request.setAttribute("ModificaProdotto", b);
		RequestDispatcher rd = request.getRequestDispatcher("adminelencoVolontari.jsp");
		rd.forward(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
