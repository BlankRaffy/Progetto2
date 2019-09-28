package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.DB;
import model.ProdottoBean;

public class ProdottoDAO {
	public ArrayList<ProdottoBean> Ricerca(String s) {
		ArrayList<ProdottoBean> prodotti = new ArrayList<ProdottoBean>();

		try {
			Connection conn = DB.getConnection();

			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT  * FROM farmacia.prodotto where Nome  LIKE '%" + s + "%' ");
			while (rs.next()) {
				ProdottoBean a = new ProdottoBean(rs.getDouble("Prezzo"), rs.getDouble("Iva"), rs.getNString("Nome"),
						rs.getNString("Immagine"), rs.getNString("Descrizione"), rs.getInt("PDisponibili"),
						rs.getInt("IdCodice"));
				prodotti.add(a);

			}

		}

		catch (Exception e) {
			System.out.println("Errore durante la connessione." + e.getMessage());
			System.out.println("se sei qui non funziona");
			return null;
		}
		return prodotti;
	}

	public ArrayList<ProdottoBean> GetAllProdtti() {
		ArrayList<ProdottoBean> prodotti = new ArrayList<ProdottoBean>();
		try {
			Connection conn = DB.getConnection();

			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT  * FROM farmacia.prodotto ");

			while (rs.next()) {
				ProdottoBean a = new ProdottoBean(rs.getDouble("Prezzo"), rs.getDouble("Iva"), rs.getNString("Nome"),
						rs.getNString("Immagine"), rs.getNString("Descrizione"), rs.getInt("PDisponibili"),
						rs.getInt("IdCodice"));
				prodotti.add(a);

			}

		}

		catch (Exception e) {
			System.out.println("Errore durante la connessione." + e.getMessage());
			System.out.println("se sei qui non funziona");
			return null;
		}
		return prodotti;
	}

	public boolean modificaadmin(ProdottoBean p) {
		try {
			Connection conn = DB.getConnection();

			PreparedStatement ps = conn.prepareStatement(
					"UPDATE farmacia.prodotto SET prezzo=?, iva=?, nome = ?, immagine=?, descrizione =?,Pdisponibili=?   WHERE IdCodice = ?");
			ps.setDouble(1, p.getPrezzo());
			ps.setDouble(2, p.getIva());
			ps.setString(3, p.getNome());
			ps.setString(4, p.getImmagine());
			ps.setString(5, p.getDescrizione());
			ps.setInt(6, p.getPdisponibili());
			ps.setInt(7, p.getCodice());

			ps.executeUpdate();

		}

		catch (Exception e) {
			System.out.println("Errore durante la connessione." + e.getMessage());
			System.out.println("se sei qui non funziona");
			return false;
		}
		return true;
	}

	public String GetImmages(String nome) {

		try {
			Connection conn = DB.getConnection();

			PreparedStatement st = conn.prepareStatement("SELECT  immagine FROM farmacia.prodotto where Nome = ?");
			st.setString(1, nome);
			ResultSet rs = st.executeQuery();

			while (rs.next())

				return rs.getString("Immagine");
		}

		catch (Exception e) {
			System.out.println("Errore durante la connessione." + e.getMessage());
			System.out.println("se sei qui non funziona");

			return null;
		}
		return null;
	}

	public double GetPrezzo(String nome) {

		try {
			Connection conn = DB.getConnection();

			PreparedStatement st = conn.prepareStatement("SELECT  Prezzo FROM farmacia.prodotto where Nome = ?");
			st.setString(1, nome);
			ResultSet rs = st.executeQuery();

			while (rs.next())

				return rs.getDouble("Prezzo");
		}

		catch (Exception e) {
			System.out.println("Errore durante la connessione." + e.getMessage());
			System.out.println("se sei qui non funziona");

		}
		return 0;
	}

	public ProdottoBean GetProdotto(int codice) {
		ProdottoBean prodotto = null;
		try {
			Connection conn = DB.getConnection();

			PreparedStatement st = conn.prepareStatement("SELECT  * FROM farmacia.prodotto where IdCodice = ?");
			st.setInt(1, codice);
			ResultSet rs = st.executeQuery();

			if (rs.first()) {
				prodotto = new ProdottoBean(rs.getDouble("prezzo"), rs.getDouble("iva"), rs.getNString("nome"),
						rs.getNString("immagine"), rs.getNString("descrizione"), rs.getInt("Pdisponibili"), codice);
				return prodotto;
			}
		} catch (Exception e) {
			System.out.println("Errore durante la connessione." + e.getMessage());
			System.out.println("se sei qui non funziona");

		}
		return prodotto;
	}

}
