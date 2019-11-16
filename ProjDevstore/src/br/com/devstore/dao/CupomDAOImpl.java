package br.com.devstore.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import br.com.devstore.model.Cliente;
import br.com.devstore.model.Cupom;

public class CupomDAOImpl implements CupomDAO{
	
	private EntityManagerFactory emf;

	public CupomDAOImpl(){
		emf = Persistence.createEntityManagerFactory("DEVSTORE");
	}

	@Override
	public Cupom pesquisar(String codCupom) {
		
		Cupom c = null;
		
		EntityManager em = emf.createEntityManager();
		
		Query query = (Query) em.createQuery("from Cupom where codigoCupom = :codigoCupom");
		query.setParameter("codigoCupom", codCupom);
		if(query.getResultList().size() >= 1){
			c = (Cupom) query.getResultList().get(0);
		}
		
		return c;
	}

}
