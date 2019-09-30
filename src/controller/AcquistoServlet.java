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

import dao.FatturaDAO;
import model.ProdottoBean;
import model.UserBean;
import model.FatturaBean;

@SuppressWarnings("serial")
@WebServlet("/AcquistoServlet")

public class AcquistoServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		ArrayList<ProdottoBean> carrello = (ArrayList<ProdottoBean>) session.getAttribute("carrello");
		UserBean user = (UserBean) session.getAttribute("utente");
		ArrayList<FatturaBean> fattura = new ArrayList<FatturaBean>();
		for (int i = 0; i < carrello.size(); i++) { 
			FatturaBean a = new FatturaBean();
			a.setEmail(user.getEmail());
			a.setProdotto(carrello.get(i));
			a.setImporto(carrello.get(i).getPrezzo() * carrello.get(i).getPdisponibili());
			 a.setIva(carrello.get(i).getIva());
			fattura.add(a);

		}
        FatturaDAO salva = new FatturaDAO();
        salva.SalvaFattura(fattura);
		session.setAttribute("fattura", fattura);
		RequestDispatcher rd = request.getRequestDispatcher("Acquisto.jsp");
		rd.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
