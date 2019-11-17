package br.com.devstore.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import br.com.devstore.model.Licenca;

public class LicencaDAOImpl implements LicencaDAO{
	
	private EntityManagerFactory emf;

	public LicencaDAOImpl(){
		emf = Persistence.createEntityManagerFactory("DEVSTORE");
	}

	@Override
	public boolean inserir(Licenca licenca) {
		try {
			EntityManager em = emf.createEntityManager();
			em.getTransaction().begin();
			em.persist(licenca);
			em.getTransaction().commit();
			em.close();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
		}
		return false;
	}

}
