package br.com.devstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import br.com.devstore.model.Licenca;
import br.com.devstore.model.Vendedor;

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

	@Override
	public Licenca getByIdVendedor(int id) {
		
		Licenca l = new Licenca();

		EntityManager em = emf.createEntityManager();

		Query query = (Query) em
				.createQuery("from Licenca where vendedor_idVendedor = :id");
		query.setParameter("id", id);
		if (query.getResultList().size() >= 1) {
			l = (Licenca) query.getResultList().get(0);
		}
		
		System.out.println("Licenca ID: ------------" + l.getIdLicenca());

		return l;
	}

	@Override
	public boolean excluir(Licenca l) {
		/*try {
			EntityManager em = emf.createEntityManager();
			em.getTransaction().begin();
			em.remove(l);
			em.getTransaction().commit();
			em.close();
			return true;
		} catch (Exception e) {
			e.getStackTrace();
		}
		return false;*/
		try {
			Connection con = ConnectionManager.getInstance().getConnection();
			/*String sql = "delete from licenca "
					+ " where idLicenca=?";*/
			String query = "{call proc_remove_licenca(?)}";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setLong(1, l.getIdLicenca());
			stmt.executeUpdate();
			con.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}
