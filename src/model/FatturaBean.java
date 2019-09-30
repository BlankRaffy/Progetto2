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

	public ProdottoBean getProdotto() {
		return prodotto;
	}

	public void setProdotto(ProdottoBean prodotto) {
		this.prodotto = prodotto;
	}

	public double getImporto() {
		return importo;
	}

	public void setImporto(double importo) {
		this.importo = importo;
	}

	private String Email;
	private ProdottoBean prodotto;
	private double importo;

}
