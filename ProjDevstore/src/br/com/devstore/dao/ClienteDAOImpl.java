package br.com.devstore.dao;

import java.util.ArrayList;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;

import antlr.collections.List;
import br.com.devstore.model.Cliente;
import br.com.devstore.model.Endereco;

public class ClienteDAOImpl implements ClienteDAO{
	
	private EntityManagerFactory emf;
	private EntityManager em;

	public ClienteDAOImpl(){
		emf = Persistence.createEntityManagerFactory("DEVSTORE");
		em = emf.createEntityManager();
	}

	public ArrayList<Cliente> pesquisar(Cliente cliente) {
		// TODO Auto-generated method stub
		return null;
	}

	public Cliente pesquisarById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean inserir(Cliente cliente) {
		try {
			//EntityManager em = emf.createEntityManager();
			em.getTransaction().begin();
			em.persist(cliente);
			em.getTransaction().commit();
			em.close();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
		}
		return false;
	}

	public boolean alterar(Cliente cliente) {
		EntityManager em = emf.createEntityManager();
		try {
			
			em.getTransaction().begin();
			em.merge(cliente);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
			em.getTransaction().rollback();
		}finally{
			em.close();				
		}
		return false;
	}

	public boolean excluir(int idCliente) {
		// TODO Auto-generated method stub
		return false;
	}

	public Cliente login(String user, String senha) {
		
		System.out.println("User: " + user + " - Senha: " + senha);
		
		Cliente c = null;
		
		//EntityManager em = emf.createEntityManager();
		
		Query query = (Query) em.createQuery("from Cliente where nomeUsuario = :nomeUsuario and senha = :senha");
		query.setParameter("nomeUsuario", user);
		query.setParameter("senha", senha);
		if(query.getResultList().size() >= 1){
			c = (Cliente) query.getResultList().get(0);
			System.out.println("Cliente capturado: " + c.getNomeCompleto());
		}
		
		return c;
	}

}
