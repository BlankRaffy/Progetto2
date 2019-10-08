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

import dao.StoricoOrdiniDAO;
import model.StoricoOrdiniBean;
@WebServlet ("/AdminRicercaUtenteData")
public class AdminRicercaUtenteData extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String email = request.getParameter("email");
		String dataInizio = request.getParameter("dataInizioUtente");
		String dataFine = request.getParameter("dataFineUtente");
		ArrayList<StoricoOrdiniBean> storicoUtente = new StoricoOrdiniDAO().getByDataUtenti(dataInizio, dataFine, email);
		HttpSession session = request.getSession();
		session.setAttribute("storicoUtente", storicoUtente);
		
		 RequestDispatcher rd = request.getRequestDispatcher("AdminRicercaUtenteData.jsp");
	 		rd.forward(request, response);
	         
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
