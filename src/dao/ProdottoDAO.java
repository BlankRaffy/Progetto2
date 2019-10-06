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
						rs.getInt("IdCodice"), rs.getInt("offerta"), rs.getString("datainizio"),rs.getString("datafine"),rs.getInt("sconto"));
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
			PreparedStatement ps;
			if (p.getOfferta() == 0) {
				ps = conn.prepareStatement(
						"UPDATE farmacia.prodotto SET prezzo=?, iva=?, nome = ?, immagine=?, descrizione =?,Pdisponibili=?,offerta=?,dataInizio=?,dataFine=?,sconto=?   WHERE IdCodice = ?");
				ps.setDouble(1, p.getPrezzo());
				ps.setDouble(2, p.getIva());
				ps.setString(3, p.getNome());
				ps.setString(4, p.getImmagine());
				ps.setString(5, p.getDescrizione());
				ps.setInt(6, p.getPdisponibili());
				ps.setInt(7, 0);
				ps.setString(8, null);
				ps.setString(9, null);
				ps.setInt(10, 0);
				ps.setInt(11, p.getCodice());
			} else {
				ps = conn.prepareStatement(
						"UPDATE farmacia.prodotto SET prezzo=?, iva=?, nome = ?, immagine=?, descrizione =?,Pdisponibili=?,offerta=?,dataInizio=?,dataFine=?,sconto=?   WHERE IdCodice = ?");
				ps.setDouble(1, p.getPrezzo());
				ps.setDouble(2, p.getIva());
				ps.setString(3, p.getNome());
				ps.setString(4, p.getImmagine());
				ps.setString(5, p.getDescrizione());
				ps.setInt(6, p.getPdisponibili());
				ps.setInt(7, p.getOfferta());
				ps.setString(8, p.getDatainizio());
				ps.setString(9, p.getDatafine());
				ps.setInt(10, p.getSconto());
				ps.setInt(11, p.getCodice());
			}
			int rs = ps.executeUpdate();
			if (rs == 1)
				return true;

		}

		catch (Exception e) {
			System.out.println("Errore durante la connessione." + e.getMessage());
			System.out.println("se sei qui non funziona");
		}
		return false;
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

	public boolean AdminDelete(int codice) {
		try {
			Connection conn = DB.getConnection();
			PreparedStatement st = conn.prepareStatement("DELETE FROM farmacia.prodotto WHERE IdCodice=?");
			st.setInt(1, codice);
			int rs = st.executeUpdate();
			if (rs == 1)
				return true;
		} catch (Exception e) {
			System.out.println("Errore durante la connessione." + e.getMessage());
			System.out.println("se sei qui non funziona");

		}
		return false;
	}

	public boolean AddProdotto(ProdottoBean b) {
		try {
			Connection conn = DB.getConnection();
			double prezzo = b.getPrezzo();
			double iva = b.getIva();
			String nome = b.getNome();
			String immagine = b.getImmagine();
			String descrizione = b.getDescrizione();
			int pdisponibili = b.getPdisponibili();
			int offerta = b.getOfferta();
			PreparedStatement st;
			if (offerta == 0) {
				st = conn.prepareStatement(
						"INSERT INTO farmacia.prodotto (Prezzo, Iva, Nome, Immagine, Descrizione, PDisponibili) VALUES (?, ?, ?, ?, ?, ?)");
				st.setDouble(1, prezzo);
				st.setDouble(2, iva);
				st.setString(3, nome);
				st.setString(4, immagine);
				st.setString(5, descrizione);
				st.setInt(6, pdisponibili);
			} else {
			String datainizio = b.getDatainizio();
			String datafine = b.getDatafine();
			int sconto = b.getSconto();
			 st = conn.prepareStatement(
					"INSERT INTO farmacia.prodotto (Prezzo, Iva, Nome, Immagine, Descrizione, PDisponibili, offerta, datainizio, datafine, sconto) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			st.setDouble(1, prezzo);
			st.setDouble(2, iva);
			st.setString(3, nome);
			st.setString(4, immagine);
			st.setString(5, descrizione);
			st.setInt(6, pdisponibili);
			st.setInt(7, offerta);
			st.setString(8, datainizio);
			st.setString(9, datafine);
			st.setInt(10, sconto);}
			int rs = st.executeUpdate();
			if (rs == 1)
				return true;
		} catch (Exception e) {
			System.out.println("Errore durante la connessione." + e.getMessage());
			System.out.println("se sei qui non funziona");

		}
		return false;
	}
	public ArrayList<ProdottoBean> offerta() {
		ArrayList<ProdottoBean> prodotti = new ArrayList<ProdottoBean>();
		try {
			Connection conn = DB.getConnection();

			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM farmacia.prodotto where offerta=1;");
			while (rs.next()) {
				ProdottoBean a = new ProdottoBean(rs.getDouble("Prezzo"), rs.getDouble("Iva"), rs.getNString("Nome"),
						rs.getNString("Immagine"), rs.getNString("Descrizione"), rs.getInt("PDisponibili"),
						rs.getInt("IdCodice"),rs.getInt("offerta"),rs.getString("datainizio"),rs.getString("datafine"),rs.getInt("sconto"));
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
}
