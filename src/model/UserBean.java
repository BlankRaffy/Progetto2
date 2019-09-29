package model;

public class UserBean {

	public UserBean() {
	}

	public UserBean( String password, String nome, String telefono, String cognome, String email) {
		
		this.password = password;
		this.cognome = cognome;
		this.nome = nome;
		this.email = email;
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

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
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

	private String nome;
	private String cognome;
	private String password;
	private String email;
	private String telefono;
}
