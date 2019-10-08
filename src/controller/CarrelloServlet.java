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
		request.setCharacterEncoding("UTF-8");


		
		String json = request.getParameter("json");

		JSONObject data = null;
		
		try 
		{
			data = new JSONObject(json);
			
			int id = Integer.parseInt(data.getString("id"));
			int d = Integer.parseInt(data.getString("quantita"));
	
			ProdottoBean pb = new ProdottoDAO().GetProdotto(id);
			pb.setPdisponibili(d);
			
			ArrayList<ProdottoBean> carrello = (ArrayList<ProdottoBean>) request.getSession().getAttribute("carrello");
			
			if (carrello == null) 
			{
				carrello = new ArrayList<ProdottoBean>();
				carrello.add(pb);
			} 
			else 
			{
				int esiste = 0;
				
				for (ProdottoBean cp : carrello) 
					if(cp.getCodice() == pb.getCodice())
					{
						cp.setPdisponibili(cp.getPdisponibili() + pb.getPdisponibili());
						esiste = 1;
					}
				
				if(esiste == 0)
					carrello.add(pb);
			}
			
			request.getSession().setAttribute("carrello", carrello);
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
