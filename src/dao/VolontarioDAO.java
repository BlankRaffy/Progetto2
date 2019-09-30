package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.DB;
import model.UserBean;
import model.VolontarioBean;

public class VolontarioDAO {
	public boolean registrazionev(VolontarioBean u) {

		try {
			Connection conn = DB.getConnection();

			Statement st = conn.createStatement();

			st.executeUpdate(
					"INSERT INTO farmacia.volontario (Nome, Cognome, Telefono, Password, Email, orario) VALUES ('"
							+ u.getNome() + "','" + u.getCognome() + "','" + u.getTelefono() + "', '" + u.getPassword() + "', '" + u.getEmail() + "','"+ u.getOrario()+"');");
		} catch (Exception e) {
			System.out.println("Errore durante la connessione." + e.getMessage());
			return false;
		}

		return true;
	}

	public ArrayList<VolontarioBean> GetVolontari() {
		ArrayList<VolontarioBean> volontari = new ArrayList<VolontarioBean>();
		try {
			Connection conn = DB.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT  * FROM farmacia.volontario ");

			while (rs.next()) {
				VolontarioBean a = new VolontarioBean(rs.getNString("immagine"), rs.getNString("nome"),
						rs.getNString("cognome"), rs.getNString("password"), rs.getNString("email"),
						rs.getNString("telefono"), rs.getNString("orario"));
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

	public VolontarioBean GetVolontario(String email) {
		VolontarioBean v = null;
		try {
			Connection conn = DB.getConnection();
			PreparedStatement st = conn.prepareStatement("SELECT  * FROM farmacia.volontario where email = ?");
			st.setString(1, email);
			ResultSet rs = st.executeQuery();

			if (rs.first()) {
				v = new VolontarioBean(rs.getNString("immagine"), rs.getNString("nome"), rs.getNString("cognome"),
						rs.getNString("password"), email, rs.getNString("telefono"), rs.getNString("orario"));
			}
		}

		catch (Exception e) {
			System.out.println("Errore durante la connessione." + e.getMessage());
			System.out.println("se sei qui non funziona");
		}
		return v;
	}

	public boolean ModificaVolontari(VolontarioBean v) {
		try {
			Connection conn = DB.getConnection();
			PreparedStatement st = conn.prepareStatement(
					"UPDATE farmacia.volontario SET immagine = ?, nome=?, cognome=?, telefono=?, orario=?  WHERE email = ?");
			st.setString(1, v.getImmagine());
			st.setString(2, v.getNome());
			st.setString(3, v.getCognome());
			st.setString(4, v.getTelefono());
			st.setString(5, v.getOrario());
			st.setString(6, v.getEmail());
			int rs = st.executeUpdate();
			if (rs == 1)
				return true;
		}

		catch (Exception e) {
			System.out.println("Errore durante la connessione." + e.getMessage());
			System.out.println("se sei qui non funziona");
		}
		return false;
	}

	public boolean AdminDeleteVolontario(String email) {
		try {
			Connection conn = DB.getConnection();
			PreparedStatement st = conn.prepareStatement("DELETE FROM farmacia.volontario WHERE email =?");
			st.setString(1, email);
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