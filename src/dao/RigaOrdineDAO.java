package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.DB;
import model.RigaOrdineBean;

public class RigaOrdineDAO {

		public boolean AddRigaOrdine(RigaOrdineBean b , int codiceOrdine) {
			try {
				Connection conn = DB.getConnection();
				
				double Prezzo =b.getPrezzo();
				int Quantita =b.getQuantita();
				double iva = b.getIva();
				int id = codiceOrdine;
				int IdProdotto = b.getIdProdotto();
				
				PreparedStatement st = conn.prepareStatement("INSERT INTO farmacia.rigaOrdine (Prezzo, Quantita,Iva,IdOrdine,IdProdotto) VALUES (?, ?,?,?,?)");
				st.setDouble(1, Prezzo);
				st.setInt(2, Quantita);
				st.setDouble(3,iva );
				st.setInt(4, id);
				st.setInt(5,IdProdotto );
				
				
				
				int rs = st.executeUpdate();
				if (rs == 1)
					return true;
			} catch (Exception e) {
				System.out.println("Errore durante la connessione." + e.getMessage());
				System.out.println("se sei qui non funziona");

			}
			return false;
		}
		
		
		
		public ArrayList<RigaOrdineBean> getRigaOrdine (int IdOrdine){
			try {
				Connection conn = DB.getConnection();
	       
	            ArrayList <RigaOrdineBean> righe = new ArrayList<RigaOrdineBean>() ;
	            PreparedStatement ps = conn
						.prepareStatement("SELECT * FROM farmacia.RigaOrdine WHERE IdOrdine = ? ");

				ps.setInt(1, IdOrdine);
				ResultSet rs = ps.executeQuery();
				while (rs.next()){
					
					RigaOrdineBean a = new RigaOrdineBean();
					a.setIdCodice(rs.getInt("IdOrdine"));
					a.setIdProdotto(rs.getInt("IdProdotto"));
					a.setIva(rs.getDouble("Iva"));
					a.setPrezzo(rs.getDouble("Prezzo"));
					a.setQuantita(rs.getInt("Quantita"));
					righe.add(a);
					
					
				}
				return righe;
				
				
				
			}
			catch (Exception e ) {
				System.out.println("Errore durante la connessione." + e.getMessage());
				System.out.println("se sei qui non funziona");
				return null;
			}
			
		}
}
