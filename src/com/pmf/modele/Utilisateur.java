package com.pmf.modele;

import javax.annotation.Generated;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Un utilisateur de la place de march�
 */
@Entity
public class Utilisateur {
	protected String adresseEMail;
	protected String telephone;
	private String nomDeSonChat;
	@Id	
	protected String identifiant;
	protected String motDePasse;
	
	public Utilisateur(String adresseEMail, String telephone,
			String identifiant, String motDePasse) {
		super();
		this.adresseEMail = adresseEMail;
		this.telephone = telephone;
		this.identifiant = identifiant;
		this.motDePasse = motDePasse;
	}

	public Utilisateur() {
		// TODO Auto-generated constructor stub
	}

	public String getAdresseEMail() {
		return adresseEMail;
	}

	public void setAdresseEMail(String adresseEMail) {
		this.adresseEMail = adresseEMail;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getIdentifiant() {
		return identifiant;
	}

	public void setIdentifiant(String identifiant) {
		this.identifiant = identifiant;
	}

	public String getMotDePasse() {
		return motDePasse;
	}

	public void setMotDePasse(String motDePasse) {
		this.motDePasse = motDePasse;
	}
	
	
}
