package model;

public class ReclamoBean {

	public ReclamoBean(String nome, String cognome, String telefono, String email, String commenti) {

		this.nome = nome;
		this.cognome = cognome;
		this.email = email;
		this.commenti = commenti;
		this.numero = telefono;

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

	public String getCommenti() {
		return commenti;
	}

	public void setCommenti(String commenti) {
		this.commenti = commenti;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	private String nome;
	private String cognome;
	private String email;
	private String commenti;
	private String numero;
}
