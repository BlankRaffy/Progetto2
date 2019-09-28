package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.DB;
import model.VolontarioBean;

public class VolontarioDAO {

	public ArrayList<VolontarioBean> GetVolontari() {
		ArrayList<VolontarioBean> volontari = new ArrayList<VolontarioBean>();
		try {
			Connection conn = DB.getConnection();

			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT  * FROM farmacia.volontario ");

			while (rs.next()) {
				VolontarioBean a = new VolontarioBean(rs.getNString("immagine"), rs.getNString("nome"),
						rs.getNString("cognome"), rs.getNString("username"), rs.getNString("password"),
						rs.getNString("email"), rs.getNString("telefono"), rs.getNString("orario"));
				volontari.add(a);

			}

		}

		catch (Exception e) {
			System.out.println("Errore durante la connessione." + e.getMessage());
			System.out.println("se sei qui non funziona");
			return null;
		}
		return volontari;
	}

}
