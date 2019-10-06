package model;

import java.sql.Date;

public class OrdinazioneBean {

	public int getIdOrdine() {
		return IdOrdine;
	}

	public void setIdOrdine(int idOrdine) {
		IdOrdine = idOrdine;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	private int IdOrdine;
	private String date;
	private String email;
}
