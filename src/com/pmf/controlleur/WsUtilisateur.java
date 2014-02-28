package com.pmf.controlleur;

import java.util.List;

import javax.ejb.EJB;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;

import com.pmf.modele.Utilisateur;
import com.pmf.service.UtilisateurService;

@Path("user")
public class WsUtilisateur {

	
	@EJB
	UtilisateurService service;
	
	
	@GET
	public Utilisateur getUser(){
		return service.getUser("nicolas");
	}
	
	@GET
	@Path("{uuid}")
	public Utilisateur getUser(@PathParam("uuid") String uuid){
		return service.getUser(uuid);
	}
	
	
	@GET
	@Path("all")
	public List<Utilisateur> getUsers(){
		return service.getAllUsersByTypedQuery();
	}
}
