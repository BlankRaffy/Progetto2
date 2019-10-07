package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReclamoDAO;
import model.ReclamoBean;

@WebServlet("/SendReclamoServlet")
public class SendReclamoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReclamoBean reclamo = new ReclamoBean(request.getParameter("nome"), request.getParameter("cognome"),
				request.getParameter("telefono"), request.getParameter("email"), request.getParameter("commenti"));
		ReclamoDAO r= new ReclamoDAO();
		boolean rec= r.sendReclamo(reclamo);
		request.setAttribute("recsended", rec);
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
