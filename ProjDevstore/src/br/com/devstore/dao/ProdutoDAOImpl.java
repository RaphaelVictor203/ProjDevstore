package br.com.devstore.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import br.com.devstore.model.Cliente;
import br.com.devstore.model.Licenca;
import br.com.devstore.model.Produto;

public class ProdutoDAOImpl implements ProdutoDAO{
	
	private EntityManagerFactory emf;

	public ProdutoDAOImpl(){
		emf = Persistence.createEntityManagerFactory("DEVSTORE");
	}

	@Override
	public List<Produto> pesquisarTodos() {
		
		List<Produto> lista = new ArrayList<Produto>();
		
		EntityManager em = emf.createEntityManager();

		Query query = (Query) em
				.createQuery("from Produto");
		if (query.getResultList().size() >= 1) {
			lista = (ArrayList<Produto>) query.getResultList();
		}
		
		return lista;
	}

	@Override
	public List<Produto> pesquisaEspecifica(int tipo, int faixa, String nomeProduto) {
		
		String strFaixa = "";
		
		EntityManager em = emf.createEntityManager();
		
		List<Produto> produtos = new ArrayList<Produto>();
		
		if(faixa == 0){
			strFaixa = " and preco <= :pr1";
		}else 
		if(faixa == 1){
			strFaixa = " and preco >= :pr1 and preco <= :pr2";
		}else
		if(faixa == 2){
			strFaixa = " and preco >= :pr1 and preco <= :pr2";
		}
		else
		if(faixa == 3){
			strFaixa = " and preco >= :pr1";
		}else{
			strFaixa = "";
		}
		
		Query query = (Query) em.createQuery("from Produto where nomeProduto LIKE :nomeProduto and tipo_idTipo = :tipo" + strFaixa);
		query.setParameter("nomeProduto", "%" + nomeProduto + "%");
		query.setParameter("tipo", tipo);
		
		if(faixa == 0){
			query.setParameter("pr1", 500.0);
		}else 
		if(faixa == 1){
			query.setParameter("pr1", 100.0);
			query.setParameter("pr2", 500.0);
		}else
		if(faixa == 2){
			query.setParameter("pr1", 500.0);
			query.setParameter("pr2", 1000.0);
		}
		else
		if(faixa == 3){
			query.setParameter("pr1", 1000.0);
		}
		
		if(query.getResultList().size() >= 1){
			produtos = query.getResultList();
		}
	
		return produtos;
	}

	@Override
	public Produto pesquisarById(int id) {
		
		EntityManager em = emf.createEntityManager();
		
		Produto p = new Produto();
		
		Query query = (Query) em.createQuery("from Produto where idProduto = :idProduto");
		query.setParameter("idProduto",id);
		
		if(query.getResultList().size() >= 1){
			p = (Produto) query.getResultList().get(0);
		}
		
		return p;
	}

	@Override
	public boolean insert(Produto p) {
		try {
			EntityManager em = emf.createEntityManager();
			em.getTransaction().begin();
			em.persist(p);
			em.getTransaction().commit();
			em.close();
			
			/*Connection con = ConnectionManager.getInstance().getConnection();
			String query = "insert into produto(idProduto, descricao, informacoes, nomeProduto"
					+ ", preco, tipo_idProduto) values ()";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setLong(1, l.getIdLicenca());
			stmt.executeUpdate();
			con.close();*/
			
			return true;
		} catch (Exception e) {
			e.getStackTrace();
		}
		return false;
	}

}
