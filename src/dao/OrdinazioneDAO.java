package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import model.DB;
import model.OrdinazioneBean;
import model.ProdottoBean;

public class OrdinazioneDAO {
	public boolean AddOrdinazione(OrdinazioneBean b) {
		try {
			Connection conn = DB.getConnection();
			String Email =b.getEmail();
			String Data =b.getDate();
			PreparedStatement st = conn.prepareStatement("INSERT INTO farmacia.ordinazione (date, Email) VALUES (?, ?)");
			st.setString(1, Data);
			st.setString(2, Email);
			
			int rs = st.executeUpdate();
			if (rs == 1)
				return true;
		} catch (Exception e) {
			System.out.println("Errore durante la connessione." + e.getMessage());
			System.out.println("se sei qui non funziona");

		}
		return false;
	}


}
