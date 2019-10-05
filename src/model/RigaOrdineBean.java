package model;

public class RigaOrdineBean {
	public RigaOrdineBean() {
	}

	public int getIdCodice() {
		return idCodice;
	}

	public void setIdCodice(int idCodice) {
		this.idCodice = idCodice;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public int getQuantita() {
		return quantita;
	}

	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}

	public double getIva() {
		return iva;
	}

	public void setIva(double iva) {
		this.iva = iva;
	}
	public int getIdProdotto() {
		return IdProdotto;
	}

	public void setIdProdotto(int idProdotto) {
		IdProdotto = idProdotto;
	}

	private int idCodice;
	private double prezzo;
	private int quantita;
	private double iva;
	private int IdProdotto;
	
}
