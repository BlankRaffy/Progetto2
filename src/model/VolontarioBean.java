package model;

public class VolontarioBean {

	public VolontarioBean() {
	}

	public VolontarioBean(String immagine, String nome, String cognome, String password, String email,
			String telefono, String orario) {
		this.immagine = immagine;
		this.nome = nome;
		this.cognome = cognome;
		this.password = password;
		this.email = email;
		this.telefono = telefono;
		this.orario = orario;
	}

	public String getImmagine() {
		return immagine;
	}

	public void setImmagine(String immagine) {
		this.immagine = immagine;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getOrario() {
		return orario;
	}

	public void setOrario(String orario) {
		this.orario = orario;
	}

	private String immagine;
	private String nome;
	private String cognome;
	private String password;
	private String email;
	private String telefono;
	private String orario;
}
