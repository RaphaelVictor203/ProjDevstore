package br.com.devstore.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import br.com.devstore.model.Carrinho;

public class CarrinhoDAOImpl implements CarrinhoDAO{

	private EntityManagerFactory emf;
	
	@Override
	public boolean inserir(Carrinho carrinho) {
		EntityManager em = emf.createEntityManager();
		try {
			//EntityManager em = emf.createEntityManager();
			em.getTransaction().begin();
			em.persist(carrinho);
			em.getTransaction().commit();
			em.close();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
		}
		return false;
	}

}
