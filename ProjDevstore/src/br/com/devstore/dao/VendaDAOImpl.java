package br.com.devstore.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import br.com.devstore.model.Venda;

public class VendaDAOImpl implements VendaDAO{
	
	private EntityManagerFactory emf;
	
	public VendaDAOImpl(){
		this.emf = Persistence.createEntityManagerFactory("DEVSTORE");
	}

	@Override
	public boolean inserir(Venda venda) {
		EntityManager em = emf.createEntityManager();
		try {
			//EntityManager em = emf.createEntityManager();
			em.getTransaction().begin();
			em.persist(venda);
			em.getTransaction().commit();
			em.close();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
		}
		return false;
	}

}
