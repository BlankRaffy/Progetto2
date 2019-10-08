package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.ProdottoDAO;
import model.ProdottoBean;

@SuppressWarnings("serial") 
@WebServlet("/CarrelloDeleteServlet")

public class CarrelloDeleteServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");


		int id = Integer.parseInt(request.getParameter("id"));

		ProdottoDAO a = new ProdottoDAO();
		System.out.println(id);
 
		HttpSession session = request.getSession();
		ArrayList<ProdottoBean> carrello = (ArrayList<ProdottoBean>) session.getAttribute("carrello");
		
		ProdottoBean c = a.GetProdotto(id);
		for (int i = 0; i < carrello.size(); i++) {
			if (carrello.get(i).getCodice() == c.getCodice()) {
				carrello.remove(i);

			}
		}

		session.setAttribute("carrello", carrello);

		RequestDispatcher rd = request.getRequestDispatcher("Carrello.jsp");
		rd.forward(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
