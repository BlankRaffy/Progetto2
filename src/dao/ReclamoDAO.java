package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.DB;
import model.ReclamoBean;

public class ReclamoDAO {

	public ArrayList<ReclamoBean> GetReclami() {
		ArrayList<ReclamoBean> reclami = new ArrayList<ReclamoBean>();
		try {
			Connection conn = DB.getConnection();

			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT  * FROM farmacia.reclamo ");

			while (rs.next()) {
				ReclamoBean a = new ReclamoBean(rs.getNString("Nome"), rs.getNString("Cognome"),
						rs.getString("Telefono"), rs.getNString("Email"), rs.getNString("Commento"));
				reclami.add(a);

			}

		}

		catch (Exception e) {
			System.out.println("Errore durante la connessione." + e.getMessage());
			System.out.println("se sei qui non funziona");
			return null;
		}
		return reclami;
	}
}
