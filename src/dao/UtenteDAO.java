package dao;

import java.sql.*;

import model.DB;
import model.UserBean;

public class UtenteDAO {
	public UserBean login(String email, String pass) {
		UserBean u2 = null;

		try {
			Connection conn = DB.getConnection();

			PreparedStatement ps = conn.prepareStatement("SELECT * FROM utente WHERE Email = ? AND Password = ?");

			ps.setString(1, email);
			ps.setString(2, pass);

			ResultSet result = ps.executeQuery();

			if (result.first())
				u2 = new UserBean(result.getString("password"), result.getString("nome"), result.getString("telefono"),
						result.getString("cognome"), result.getString("email"));

			conn.close();

			return u2;

		} catch (SQLException e) {
			System.out.println("Errore durante la connessione." + e.getMessage());
		}

		return u2;
	}

	public boolean registrazioneu(UserBean u) {

		try {
			Connection conn = DB.getConnection();

			Statement st = conn.createStatement();

			st.executeUpdate("INSERT INTO farmacia.utente (Nome, Cognome, Telefono, Password, Email) VALUES ('"
					+ u.getNome() + "','" + u.getCognome() + "','" + u.getTelefono() + "', '" + u.getPassword() + "', '"
					+ u.getEmail() + "');");
		} catch (Exception e) {
			System.out.println("Errore durante la connessione." + e.getMessage());
			return false;
		}

		return true;
	}

	public boolean verificaOldPassword(String email, String oldpass) {
		try {
			Connection conn = DB.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM utente WHERE Email = ?");
			ps.setString(1, email);
			ResultSet result = ps.executeQuery();

			if (result.first()) {
				if (result.getString("Password").equalsIgnoreCase(oldpass)) {
					return true;
				}
			}

			conn.close();

		} catch (Exception e) {
			System.out.println("Errore durante la connessione." + e.getMessage());
			return false;
		}

		return false;

	}

	public boolean changePassword(String email, String newpassword) {
		try {
			Connection conn = DB.getConnection();
			PreparedStatement ps = conn.prepareStatement("UPDATE farmacia.utente SET Password =? WHERE Email = ?");
			ps.setString(0, newpassword);
			ps.setString(1, email);
			int rs = ps.executeUpdate();
			if (rs == 1)
				return true;

		} catch (Exception e) {
			System.out.println("Errore durante la connessione." + e.getMessage());
			return false;
		}

		return false;

	}

}
