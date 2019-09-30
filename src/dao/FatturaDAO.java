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

public boolean SalvaFattura(ArrayList<FatturaBean> fattura) {
	
	for (int i = 0 ; i<fattura.size();i++) {
	try {
		Connection conn = DB.getConnection();

		Statement st = conn.createStatement();

		st.executeUpdate(
				"INSERT INTO farmacia.fattura ( Importo,Iva , Email) VALUES ('"
						+ fattura.get(i).getImporto() + "','" + fattura.get(i).getIva() + "','" + fattura.get(i).getEmail()+ "');");
	} catch (Exception e) {
		System.out.println("Errore durante la connessione." + e.getMessage());
		return false;
	}

	
}
	return true;

}
}
