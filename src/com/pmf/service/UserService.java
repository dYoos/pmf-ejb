package com.pmf.service;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.pmf.modele.Utilisateur;

@Stateless
public class UserService {

	
	@PersistenceContext
	EntityManager em;
	
	public Utilisateur getUtilisateur(int id){
		
		return em.find(Utilisateur.class, id);
		
	}
}
