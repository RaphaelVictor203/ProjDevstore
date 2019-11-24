package br.com.devstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

	@Override
	public boolean inserir(Cupom c) {
		try {
			EntityManager em = emf.createEntityManager();
			em.getTransaction().begin();
			em.persist(c);
			em.getTransaction().commit();
			em.close();
			
			return true;
		} catch (Exception e) {
			e.getStackTrace();
		}
		return false;
	}

	@Override
	public List<Cupom> pesquisarByIdVendedor(int id) {
		List<Cupom> cList = new ArrayList<Cupom>();
		
		EntityManager em = emf.createEntityManager();
		
		Query query = (Query) em.createQuery("from Cupom where vendedor_idVendedor = :idVendedor");
		query.setParameter("idVendedor", id);
		if(query.getResultList().size() >= 1){
			cList = (List<Cupom>) query.getResultList();
		}
		
		return cList;
	}

	@Override
	public boolean alterar(Cupom c) {
		try {
			EntityManager em = emf.createEntityManager();
			em.getTransaction().begin();
			em.merge(c);
			em.getTransaction().commit();
			em.close();
			
			return true;
		} catch (Exception e) {
			e.getStackTrace();
		}
		return false;
	}

	@Override
	public boolean delete(int id) {
		try {
			Connection con = ConnectionManager.getInstance().getConnection();
			
			String query = "delete from cupom where idCupom = ?";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setLong(1, id);
			stmt.executeUpdate();
			
			con.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}
