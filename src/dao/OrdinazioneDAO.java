package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

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
			 st.executeUpdate();

			System.out.println("work");
			return true;
			
		
		} catch (Exception e) {
			System.out.println("Errore durante la connessione." + e.getMessage());
			System.out.println("se sei qui non funziona");
			return false;

		}
		
		
		

	
	

}
	public int getIdOrdine() {
		try {
			Connection conn = DB.getConnection();
			Statement st = conn.createStatement();
                  ResultSet rs = st.executeQuery("SELECT MAX(IdOrdine) FROM farmacia.ordinazione");
                  rs.next();
                 return Integer.parseInt(rs.getString("MAX(IdOrdine)"));
             
			
		}
		catch(Exception e) {
			System.out.println("Errore durante la connessione." + e.getMessage());
			System.out.println("se sei qui non funziona");
			return 0 ;
			
		}
		
	}
	}

