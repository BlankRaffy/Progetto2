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
@WebServlet("/CarrelloServlet")

public class CarrelloServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             
		
		int id =  Integer.parseInt(request.getParameter("id"));
           int d = Integer.parseInt(request.getParameter("quantità"));

        
       ProdottoDAO a = new ProdottoDAO();
       
       
       
         HttpSession session = request.getSession();
         if(session.getAttribute("carrello")==null) {
        	 ArrayList <ProdottoBean> carrello = new ArrayList <ProdottoBean>();
        	 carrello.add(a.GetProdotto(id));
         }
         else {
        	 ArrayList <ProdottoBean> carrello = (ArrayList<ProdottoBean>) session.getAttribute("carrello");
        	 carrello.add(a.GetProdotto(id));
        	 session.setAttribute("carrello", carrello);

         }
         

         
         
	}
	
	
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}


}
