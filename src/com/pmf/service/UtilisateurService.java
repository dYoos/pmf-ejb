package com.pmf.service;

import java.util.List;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.ejb.Singleton;
import javax.ejb.Startup;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transaction;

import com.pmf.modele.Utilisateur;

@Singleton
@Startup
public class UtilisateurService {

	@PersistenceContext
	EntityManager em;

	@PostConstruct
	public void start() {
		System.out.println("Hello I'm the Singleton 6");

		Utilisateur nicolas = new Utilisateur("nicolas@robusta.io", "00",
				"nicolas", "root");
		em.persist(nicolas);

		for (int i = 0; i < 25; i++) {
			Utilisateur u = new Utilisateur("user-" + i + "@robusta.io", "00",
					createUUID(), "root");
			em.persist(u);
		}

	}

	public String createUUID() {
		return UUID.randomUUID().toString();
	}

	public Utilisateur getUser(String id) {
		return em.find(Utilisateur.class, id);
	}

	public Utilisateur getAllUsers() {
		return (Utilisateur) em.createQuery("SELECT u FROM Utilisateur")
				.getResultList();
	}

	public List<Utilisateur> getAllUsersByTypedQuery() {
		CriteriaBuilder builder = em.getCriteriaBuilder();
		CriteriaQuery<Utilisateur> query = builder
				.createQuery(Utilisateur.class);
		//Root<Transaction> transaction = query.from(Transaction.class);
		// Don't know if I can do "account.id" here		
		return em.createQuery(query).getResultList();
	}
	
	

}
