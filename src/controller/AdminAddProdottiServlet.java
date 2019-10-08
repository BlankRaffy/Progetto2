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
		request.setCharacterEncoding("UTF-8");


		String json = request.getParameter("json");

		JSONObject data = null;

		try {
			data = new JSONObject(json);
			ProdottoBean p;
			if (Integer.parseInt(data.getString("offerta")) == 0) {
				p = new ProdottoBean(Double.parseDouble(data.getString("prezzo")),
						Double.parseDouble(data.getString("iva")), data.getString("nome"), data.getString("immagine"),
						data.getString("descrizione"), Integer.parseInt(data.getString("pd")), 0);
			} else {
				p = new ProdottoBean(Double.parseDouble(data.getString("prezzo")),
						Double.parseDouble(data.getString("iva")), data.getString("nome"), data.getString("immagine"),
						data.getString("descrizione"), Integer.parseInt(data.getString("pd")), 0,
						Integer.parseInt(data.getString("offerta")), data.getString("datainizio"),
						data.getString("datafine"), Integer.parseInt(data.getString("sconto")));
			}

			(new ProdottoDAO()).AddProdotto(p);

		} catch (JSONException e) {
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
