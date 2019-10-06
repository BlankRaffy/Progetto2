package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

		} catch (Exception e) {

			System.out.println("Errore durante la connessione." + e.getMessage());
			System.out.println("se sei qui non funziona");
            return false;
		}
		return true;

	}
	
	public ArrayList <FatturaBean> getFattura(String Email) {
		try {
			Connection conn = DB.getConnection();
            String email = Email;
            ArrayList <FatturaBean> fattura = new ArrayList<FatturaBean>() ;
            PreparedStatement ps = conn
					.prepareStatement("SELECT * FROM farmacia.fattura WHERE Email = ? ");

			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();
			while (rs.next()){
				FatturaBean a = new FatturaBean();
				a.setImporto(rs.getDouble("Importo"));
				a.setIdOrdine(rs.getInt("IdOrdine"));
				a.setIva(rs.getDouble("Iva"));
				fattura.add(a);
			}
			return fattura;
			
		}
		catch (Exception e){
			System.out.println("Errore durante la connessione." + e.getMessage());
			System.out.println("se sei qui non funziona");
            return null;
			
		}
		
	}
}
