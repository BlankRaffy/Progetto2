package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.DB;
import model.StoricoOrdiniBean;

public class StoricoOrdiniDAO {

	public ArrayList<StoricoOrdiniBean> getByData(String data_inizio, String data_fine) {
		ArrayList<StoricoOrdiniBean> storicoOrdini =  new ArrayList<StoricoOrdiniBean>();
		try {
			Connection conn = DB.getConnection();

			PreparedStatement st = conn.prepareStatement(
					"SELECT * FROM farmacia.rigaordine NATURAL JOIN farmacia.ordinazione natural join farmacia.utente  WHERE date BETWEEN '"+data_inizio+"' AND '"+data_fine+"' ");
			 ResultSet rs =   st.executeQuery();
			 while(rs.next()) {
				 StoricoOrdiniBean a = new StoricoOrdiniBean();
				 a.setCognome(rs.getString("Cognome"));
				 a.setData(rs.getString("date"));
				 a.setEmail(rs.getString("Email"));
				 a.setIdOrdine(rs.getInt("IdOrdine"));
				 a.setIdProdotto(rs.getInt("IdProdotto"));
				 a.setNome(rs.getString("Nome"));
				 a.setPrezzo(rs.getDouble("Prezzo"));
				 a.setQuantita(rs.getInt("Quantita"));
				 storicoOrdini.add(a);
			     

			 }
			 
			 return storicoOrdini;

		}

		catch (Exception e) {
			System.out.println("Errore durante la connessione." + e.getMessage());
			System.out.println("se sei qui non funziona");
			return null;
		}

	}
	public ArrayList<StoricoOrdiniBean> getByDataUtenti(String data_inizio, String data_fine , String email) {
		ArrayList<StoricoOrdiniBean> storicoOrdini =  new ArrayList<StoricoOrdiniBean>();
		try {
			Connection conn = DB.getConnection();

			PreparedStatement st = conn.prepareStatement(
					"SELECT * FROM farmacia.rigaordine NATURAL JOIN farmacia.ordinazione natural join farmacia.utente  WHERE date BETWEEN '"+data_inizio+"' AND '"+data_fine+"' AND Email ='"+email+"' ");
			 ResultSet rs =   st.executeQuery();
			 while(rs.next()) {
				 StoricoOrdiniBean a = new StoricoOrdiniBean();
				 a.setCognome(rs.getString("Cognome"));
				 a.setData(rs.getString("date"));
				 a.setEmail(rs.getString("Email"));
				 a.setIdOrdine(rs.getInt("IdOrdine"));
				 a.setIdProdotto(rs.getInt("IdProdotto"));
				 a.setNome(rs.getString("Nome"));
				 a.setPrezzo(rs.getDouble("Prezzo"));
				 a.setQuantita(rs.getInt("Quantita"));
				 storicoOrdini.add(a);
			     

			 }
			 
			 return storicoOrdini;

		}

		catch (Exception e) {
			System.out.println("Errore durante la connessione." + e.getMessage());
			System.out.println("se sei qui non funziona");
			return null;
		}
}
}
