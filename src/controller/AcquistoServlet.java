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
import dao.RigaOrdineDAO;
import model.ProdottoBean;
import model.RigaOrdineBean;
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

		// passo gli oggetti all'ordinazione
		ordine.setDate(data);
		ordine.setEmail(user.getEmail());

		// salvo nel database
		OrdinazioneDAO saveOrdine = new OrdinazioneDAO();
		saveOrdine.AddOrdinazione(ordine);
		int codiceOrdine = saveOrdine.getIdOrdine();
        double totale = 0;
		// salvare la varie rige d'ordine e istanziarle
		for (int i = 0; i < carrello.size(); i++) {
			
			RigaOrdineDAO salvaRiga = new RigaOrdineDAO();
			RigaOrdineBean riga = new RigaOrdineBean();
			riga.setIdCodice(carrello.get(i).getCodice());
			riga.setIva(carrello.get(i).getIva());
			riga.setPrezzo(carrello.get(i).getPrezzo());
			riga.setQuantita(carrello.get(i).getPdisponibili());
			riga.setIdProdotto(carrello.get(i).getCodice());
			salvaRiga.AddRigaOrdine(riga, codiceOrdine);
			totale = totale + carrello.get(i).getPrezzo() * carrello.get(i).getPdisponibili() ;
		}
		
        System.out.println("test pre fattura");
		//salva nella fattura 
		FatturaBean fattura = new FatturaBean();
		fattura.setEmail(user.getEmail());
		fattura.setIva(carrello.get(0).getIva());
		fattura.setIdOrdine(codiceOrdine);
		fattura.setImporto(totale);
		 FatturaDAO salvafattura = new FatturaDAO();
		 salvafattura.SalvaFattura(fattura);
		

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
