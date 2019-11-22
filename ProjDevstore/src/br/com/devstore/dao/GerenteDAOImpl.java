package br.com.devstore.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import br.com.devstore.model.Gerente;
import br.com.devstore.model.Vendedor;

public class GerenteDAOImpl implements GerenteDAO{
	
	private EntityManagerFactory emf;

	public GerenteDAOImpl(){
		emf = Persistence.createEntityManagerFactory("DEVSTORE");
	}

	@Override
	public Gerente getById(int id) {
		
		Gerente g = new Gerente();

		EntityManager em = emf.createEntityManager();

		Query query = (Query) em
				.createQuery("from Gerente where idGerente = :id");
		query.setParameter("id", id);
		if (query.getResultList().size() >= 1) {
			g = (Gerente) query.getResultList().get(0);
		}

		return g;
	}

}
