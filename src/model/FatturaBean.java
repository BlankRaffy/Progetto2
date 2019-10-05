package model;

import java.util.*; 

import javax.servlet.http.HttpSession;

public class FatturaBean {
	public FatturaBean() {
		// TODO Auto-generated constructor stub
	}
    
	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}



	public int getIdOrdine() {
		return IdOrdine;
	}

	public void setIdOrdine(int idOrdine) {
		IdOrdine = idOrdine;
	}

	public double getImporto() {
		return importo;
	}

	public double getIva() {
		return iva;
	}

	public void setIva(double iva) {
		this.iva = iva;
	}

	public void setImporto(double importo) {
		this.importo = importo;
	}
	public ProdottoBean getProdotto() {
		return prodotto;
	}

	public void setProdotto(ProdottoBean prodotto) {
		this.prodotto = prodotto;
	}

	private String Email;
	private int IdOrdine;
	private double importo;
	private double iva;
	private ProdottoBean prodotto;
	


}
