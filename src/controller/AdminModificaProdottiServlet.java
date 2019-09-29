package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProdottoDAO;
import model.ProdottoBean;

@WebServlet("/AdminModificaProdottiServlet")
public class AdminModificaProdottiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ProdottoBean p = new ProdottoBean(Double.parseDouble(request.getParameter("prezzo")),
				Double.parseDouble(request.getParameter("iva")), request.getParameter("nome"),
				request.getParameter("immagine"), request.getParameter("descrizione"),
				Integer.parseInt(request.getParameter("Pdisponibili")),
				Integer.parseInt(request.getParameter("IdCodice")));

		ProdottoDAO a = new ProdottoDAO();
		
		boolean b = a.modificaadmin(p);

		request.setAttribute("ModificaProdotto", b);
		RequestDispatcher rd = request.getRequestDispatcher("adminProdotti.jsp");
		rd.forward(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
