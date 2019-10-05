package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FatturaDAO;
import dao.OrdinazioneDAO;
import model.ProdottoBean;
import model.UserBean;
import model.FatturaBean;
import model.OrdinazioneBean;

@SuppressWarnings("serial")
@WebServlet("/AcquistoServlet")

public class AcquistoServlet extends HttpServlet {
	@SuppressWarnings("deprecation")
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		ArrayList<ProdottoBean> carrello = (ArrayList<ProdottoBean>) session.getAttribute("carrello");
		UserBean user = (UserBean) session.getAttribute("utente");
		OrdinazioneBean ordinazione = new OrdinazioneBean();

		// ottengo oggetti per istanziare un ordinazione
		OrdinazioneBean ordine = new OrdinazioneBean();
		Date myDate = new Date();
		String data = new SimpleDateFormat("yyyy-MM-dd").format(myDate);
		System.out.println(data);

		// passo gli oggetti all'ordinazione
		ordine.setDate(data);
		ordine.setEmail(user.getEmail());
		
		//salvo nel database
		OrdinazioneDAO saveOrdine = new OrdinazioneDAO();
		saveOrdine.AddOrdinazione(ordine);
		
		//salvare la varie rige d'ordine e istanziarle 

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
