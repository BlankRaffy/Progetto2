package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;

import model.DB;
import model.FatturaBean;

public class FatturaDAO {
	public FatturaDAO() {
		// TODO Auto-generated constructor stub
	}

	public boolean SalvaFattura(FatturaBean b) {
		try {
			Connection conn = DB.getConnection();

			double Importo = b.getImporto();
			double iva = b.getIva();
			String email = b.getEmail();
			int id = b.getIdOrdine();

			PreparedStatement st = conn
					.prepareStatement("INSERT INTO farmacia.fattura (Importo,Iva,Email,IdOrdine) VALUES (?, ?,?,?)");
			st.setDouble(1, Importo);
			st.setDouble(2, iva);
			st.setString(3, email);
			st.setInt(4, id);

			st.executeUpdate();
			System.out.println("ma perche non funziona");

			return true;
		} catch (Exception e) {

			System.out.println("Errore durante la connessione." + e.getMessage());
			System.out.println("se sei qui non funziona");

		}
		return false;

	}
}
