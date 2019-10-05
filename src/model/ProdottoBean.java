package model;

//import java.sql.Date;

public class ProdottoBean {

	public ProdottoBean(double prezzo, double iva, String nome, String immagine, String descrizione, int Pdisponibili,
			int IdCodice, int offerta, String datainizio, String datafine, int sconto) {
		this.prezzo = prezzo;
		this.iva = iva;
		this.nome = nome;
		this.Immagine = immagine;
		this.descrizione = descrizione;
		this.Pdisponibili = Pdisponibili;
		this.codice = IdCodice;
		this.offerta = offerta;
		this.datainizio = datainizio;
		this.datafine = datafine;
		this.sconto = sconto;

	}

	public ProdottoBean(double prezzo, double iva, String nome, String immagine, String descrizione, int Pdisponibili,
			int IdCodice) {
		this.prezzo = prezzo;
		this.iva = iva;
		this.nome = nome;
		this.Immagine = immagine;
		this.descrizione = descrizione;
		this.Pdisponibili = Pdisponibili;
		this.codice = IdCodice;
		

	}
	public String getDatainizio() {
		return datainizio;
	}

	public void setDatainizio(String datainizio) {
		this.datainizio = datainizio;
	}

	public String getDatafine() {
		return datafine;
	}

	public void setDatafine(String datafine) {
		this.datafine = datafine;
	}

	public int getSconto() {
		return sconto;
	}

	public void setSconto(int sconto) {
		this.sconto = sconto;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public int getOfferta() {
		return offerta;
	}

	public void setOfferta(int offerta) {
		this.offerta = offerta;
	}

	public void setIva(double iva) {
		this.iva = iva;
	}

	public double getIva() {
		return iva;
	}

	public void setIva(int iva) {
		this.iva = iva;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getImmagine() {
		return Immagine;
	}

	public void setImmagine(String immagine) {
		this.Immagine = immagine;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public int getPdisponibili() {
		return Pdisponibili;
	}

	public void setPdisponibili(int pdisponibili) {
		this.Pdisponibili = pdisponibili;
	}

	public int getCodice() {
		return codice;
	}

	public void setCodice(int codice) {
		this.codice = codice;
	}

	private double prezzo;
	private double iva;
	private String nome;
	private String Immagine;
	private String descrizione;
	private int Pdisponibili;
	private int codice;
	private int offerta;
	private String datainizio;
	private String datafine;
	private int sconto;

}
