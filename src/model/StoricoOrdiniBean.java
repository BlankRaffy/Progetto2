package model;

public class StoricoOrdiniBean {
public StoricoOrdiniBean() {
	// TODO Auto-generated constructor stub
}

private String email;
private int idOrdine;
private int quantita;
private double prezzo;
private int idProdotto;
private String data;
private String nome;
private String cognome ;
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public int getIdOrdine() {
	return idOrdine;
}
public void setIdOrdine(int idOrdine) {
	this.idOrdine = idOrdine;
}
public int getQuantita() {
	return quantita;
}
public void setQuantita(int quantita) {
	this.quantita = quantita;
}
public double getPrezzo() {
	return prezzo;
}
public void setPrezzo(double prezzo) {
	this.prezzo = prezzo;
}
public int getIdProdotto() {
	return idProdotto;
}
public void setIdProdotto(int idProdotto) {
	this.idProdotto = idProdotto;
}
public String getData() {
	return data;
}
public void setData(String data) {
	this.data = data;
}
public String getNome() {
	return nome;
}
public void setNome(String nome) {
	this.nome = nome;
}
public String getCognome() {
	return cognome;
}
public void setCognome(String cognome) {
	this.cognome = cognome;
}

}
