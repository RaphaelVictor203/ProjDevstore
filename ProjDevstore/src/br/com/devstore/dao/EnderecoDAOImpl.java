package br.com.devstore.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import br.com.devstore.model.Endereco;

public class EnderecoDAOImpl implements EnderecoDAO{
	
	private EntityManagerFactory emf;

	public EnderecoDAOImpl(){
		emf = Persistence.createEntityManagerFactory("DEVSTORE");
	}

	@Override
	public boolean inserir(Endereco endereco) {
		try {
			EntityManager em = emf.createEntityManager();
			em.getTransaction().begin();
			em.persist(endereco);
			em.getTransaction().commit();
			em.close();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
		}
		return false;
	}

}
