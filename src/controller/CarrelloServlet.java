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

import org.json.JSONException;
import org.json.JSONObject;

import dao.ProdottoDAO;
import model.ProdottoBean;

@SuppressWarnings("serial") 
@WebServlet("/CarrelloServlet")

public class CarrelloServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
/*
		int id = Integer.parseInt(request.getParameter("id"));
		int d = Integer.parseInt(request.getParameter("quantita")); 

		ProdottoDAO a = new ProdottoDAO();
		ProdottoBean b = a.GetProdotto(id);
		b.setPdisponibili(d);

		HttpSession session = request.getSession();
		if (session.getAttribute("carrello") == null) {
			ArrayList<ProdottoBean> carrello = new ArrayList<ProdottoBean>();
			carrello.add(b);
			session.setAttribute("carrello", carrello);

		} else {
			ArrayList<ProdottoBean> carrello = (ArrayList<ProdottoBean>) session.getAttribute("carrello");
             carrello.add(b);
			session.setAttribute("carrello", carrello);

		}

		RequestDispatcher rd = request.getRequestDispatcher("Carrello.jsp");
		rd.forward(request, response);*/

		
		String json = request.getParameter("json");

		JSONObject data = null;
		
		try 
		{
			data = new JSONObject(json);
			
			int id = Integer.parseInt(data.getString("id"));
			int d = Integer.parseInt(data.getString("quantita"));
			
			ProdottoDAO a = new ProdottoDAO();
			ProdottoBean b = a.GetProdotto(id);
			b.setPdisponibili(d);

			HttpSession session = request.getSession();
			if (session.getAttribute("carrello") == null) {
				ArrayList<ProdottoBean> carrello = new ArrayList<ProdottoBean>();
				carrello.add(b);
				session.setAttribute("carrello", carrello);

			} else {
				ArrayList<ProdottoBean> carrello = (ArrayList<ProdottoBean>) session.getAttribute("carrello");
				//se prodotto è presente già nel carrello
	             carrello.add(b);
				session.setAttribute("carrello", carrello);

			}
			
		} 
		catch (JSONException e) 
		{
			e.printStackTrace();
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
