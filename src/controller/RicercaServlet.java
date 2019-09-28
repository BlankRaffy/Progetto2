package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProdottoDAO;
import model.ProdottoBean;

@WebServlet("/RicercaServlet")

public class RicercaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String a = (String) request.getParameter("search");
		ProdottoDAO risultati = new ProdottoDAO();

		ArrayList<ProdottoBean> prodotti = risultati.Ricerca(a);

		request.getSession().setAttribute("Prodotti", prodotti);
		RequestDispatcher rd = request.getRequestDispatcher("ricercaProdotti.jsp");
		rd.forward(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
