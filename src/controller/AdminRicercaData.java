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

@SuppressWarnings("serial")
@WebServlet("/AdminRicercaDAta")

public class AdminRicercaData extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		 String dataInizio = request.getParameter("dataInizio");
         String dataFine = request.getParameter("dataFine")	;
         StoricoOrdiniDAO a = new StoricoOrdiniDAO();
         ArrayList<StoricoOrdiniBean> storicoOrdini = a.getByData(dataInizio, dataFine);
         HttpSession session = request.getSession();
         session.setAttribute("Storico", storicoOrdini);
         
         RequestDispatcher rd = request.getRequestDispatcher("AdminRicercaData.jsp");
 		rd.forward(request, response);
         
  	}
	
	
	
	
protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	doGet(request, response);
}

}


