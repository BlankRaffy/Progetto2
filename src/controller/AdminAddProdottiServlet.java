package controller;
import org.json.JSONException;
import org.json.JSONObject;

import dao.ProdottoDAO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProdottoBean;
@WebServlet("/AdminAddProdottiServlet")
public class AdminAddProdottiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*ProdottoDAO a = new ProdottoDAO();
		ProdottoBean b= new ProdottoBean(Double.parseDouble(request.getParameter("prezzo")), Double.parseDouble(request.getParameter("iva")), request.getParameter("nome"), request.getParameter("immagine"), request.getParameter("descrizione"), Integer.parseInt(request.getParameter("Pdisponibili")), 0);
		boolean c=a.AddProdotto(b);
		request.setAttribute("AddProdotto", c);
		RequestDispatcher rd = request.getRequestDispatcher("adminProdotti.jsp");
		rd.forward(request, response);*/

		String json = request.getParameter("json");
		
		JSONObject data = null;
		
		try 
		{
			data = new JSONObject(json);
			
			ProdottoBean p = new ProdottoBean(Double.parseDouble(data.getString("prezzo")), Double.parseDouble(data.getString("iva")), 
					data.getString("nome"), data.getString("immagine"), data.getString("descrizione"), 
					Integer.parseInt(data.getString("prezzo")), 0);
			
			(new ProdottoDAO()).AddProdotto(p);
			
		} catch (JSONException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
