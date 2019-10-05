package dao;
import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;

import model.DB;
import model.FatturaBean;

public class FatturaDAO {
public FatturaDAO() { 
	// TODO Auto-generated constructor stub
}

/*
public boolean SalvaFattura(ArrayList<FatturaBean> fattura) {
	
	
	try {
		Connection conn = DB.getConnection();

		Statement st = conn.createStatement();

		st.executeUpdate(
				"INSERT INTO farmacia.ordinazione (data, Email) VALUES ('"
						+ u.getNome() + "','" + u.getCognome() + "','" + u.getTelefono() + "', '" + u.getPassword() + "', '" + u.getEmail() + "');");
	} catch (Exception e) {
		System.out.println("Errore durante la connessione." + e.getMessage());
		return false;
	}

	return true;
}
*/
}

