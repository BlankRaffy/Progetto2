package model;

public class ReclamoBean {

	public ReclamoBean(String nome, String cognome, String telefono, String email, String commento) {

		this.nome = nome;
		this.cognome = cognome;
		this.email = email;
		this.commento = commento;
		this.telefono = telefono;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCommento() {
		return commento;
	}

	public void setCommento(String commento) {
		this.commento = commento;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String numero) {
		this.telefono = numero;
	}

	private String nome;
	private String cognome;
	private String email;
	private String commento;
	private String telefono;
}
