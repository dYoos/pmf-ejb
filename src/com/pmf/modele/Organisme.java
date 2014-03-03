package com.pmf.modele;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Organisme {// extends Utilisateur {

	@Id
	String siret;
	String raisonSociale;
	
	public Organisme () {
		
	}

//	public Organisme(String adresseEMail, String telephone, String identifiant,
//			String motDePasse, String siret, String raisonSociale) {
//		// super(adresseEMail, telephone, identifiant, motDePasse);
//		this.siret = siret;
//		this.raisonSociale = raisonSociale;
//	}

	public String getSiret() {
		return siret;
	}

	public Organisme(String siret, String raisonSociale) {
		this.siret = siret;
		this.raisonSociale = raisonSociale;
	}

	public void setSiret(String siret) {
		this.siret = siret;
	}

	public String getRaisonSociale() {
		return raisonSociale;
	}

	public void setRaisonSociale(String raisonSociale) {
		this.raisonSociale = raisonSociale;
	}

}
