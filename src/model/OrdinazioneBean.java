package model;

import java.sql.Date;

public class OrdinazioneBean {

	public String getIdOrdine() {
		return IdOrdine;
	}

	public void setIdOrdine(String idOrdine) {
		IdOrdine = idOrdine;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	private String IdOrdine;
	private Date date;
	private String email;
}
