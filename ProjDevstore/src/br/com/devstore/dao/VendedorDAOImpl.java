package br.com.devstore.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import br.com.devstore.model.Cliente;
import br.com.devstore.model.Licenca;
import br.com.devstore.model.Vendedor;

public class VendedorDAOImpl implements VendedorDAO {

	private EntityManagerFactory emf;

	public VendedorDAOImpl(){
		emf = Persistence.createEntityManagerFactory("DEVSTORE");
	}
	
	@Override
	public Vendedor login(String usuario, String senha) {

		System.out.println("User: " + usuario + " - Senha: " + senha);

		Vendedor v = null;
		
		Licenca l = null;

		EntityManager em = emf.createEntityManager();

		Query query = (Query) em
				.createQuery("from Licenca where usuario = :nomeUsuario and senha = :senha");
		query.setParameter("nomeUsuario", usuario);
		query.setParameter("senha", senha);
		if (query.getResultList().size() >= 1) {
			l = (Licenca) query.getResultList().get(0);
			v = l.getVendedor();
			System.out.println("Vendedor capturado: " + v.getNomeCompleto());
		}

		return v;
	}

}
