package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.VolontarioDAO;

@WebServlet("/AdminDeleteVolontariServlet")
public class AdminDeleteVolontariServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String email = request.getParameter("email");
		VolontarioDAO a = new VolontarioDAO();
		boolean c = a.AdminDeleteVolontario(email);
	
		request.setAttribute("CancellaProdotto", c);
		RequestDispatcher rd = request.getRequestDispatcher("adminelencoVolontari.jsp");
		rd.forward(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
