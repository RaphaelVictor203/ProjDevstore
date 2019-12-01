package br.com.devstore.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
import br.com.devstore.model.TopVendas;
import br.com.devstore.model.TotVendasCat;
import br.com.devstore.model.TotVendasMes;
import br.com.devstore.model.Venda;

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

	@Override
	public List<Produto> pesquisarByIdVendedor(int id) {
		EntityManager em = emf.createEntityManager();
		
		List<Produto> produtos = new ArrayList<Produto>();
		
		Query query = (Query) em.createQuery("from Produto where vendedor_idVendedor = :idVendedor");
		query.setParameter("idVendedor",id);
		
		if(query.getResultList().size() >= 1){
			produtos = (List<Produto>) query.getResultList();
		}
		
		return produtos;
	}

	@Override
	public boolean alterar(Produto p) {
		try {
			EntityManager em = emf.createEntityManager();
			em.getTransaction().begin();
			em.merge(p);
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
			
			String query = "delete from produto_tag where Produto_idProduto = ?";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setLong(1, id);
			stmt.executeUpdate();
			
			query = "delete from produto where idProduto = ?";
			stmt = con.prepareStatement(query);
			stmt.setLong(1, id);
			stmt.executeUpdate();
			
			con.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<TopVendas> pesquisarTop10ProdutosVendidos(int idVendedor) {
		List<TopVendas> vendas = new ArrayList<TopVendas>();
		try {
			Connection con = ConnectionManager.getInstance().getConnection();
			//String sql = "SELECT * from tbcliente where cpf like ?";
			String sql = "select p.nomeProduto, COUNT(it.produto_idProduto) as qntd_vendas, SUM(it.subTotal)"
						 + " as total_retornado from item as it inner join produto as p on p.idProduto = it.produto_idProduto"
						 + " where p.vendedor_idVendedor = ? group by p.nomeProduto order by qntd_vendas DESC LIMIT 10";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, idVendedor);
			ResultSet  rs = stmt.executeQuery();		
			while(rs.next()) {
				TopVendas tv = new TopVendas();
				tv.setNomeProduto(rs.getString("nomeProduto"));
				tv.setQntd_vendas(rs.getInt("qntd_vendas"));
				tv.setTotal_retornado(rs.getDouble("total_retornado"));
				vendas.add(tv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vendas;
	}

	@Override
	public List<TotVendasCat> pesquisarTotalVendasPCategoria(int idVendedor) {
		List<TotVendasCat> vendas = new ArrayList<TotVendasCat>();
		try {
			Connection con = ConnectionManager.getInstance().getConnection();
			//String sql = "SELECT * from tbcliente where cpf like ?";
			String sql = "select tp.nomeTipo as categoria, COUNT(it.produto_idProduto) as qntd_vendas, SUM(it.subTotal) "
					+ " as total_retornado from item as it inner join produto as p on p.idProduto = it.produto_idProduto"
					+ " inner join tipo as tp on tp.idTipo = p.tipo_idTipo where p.vendedor_idVendedor = ? group by tp.nomeTipo";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, idVendedor);
			ResultSet  rs = stmt.executeQuery();		
			while(rs.next()) {
				TotVendasCat tv = new TotVendasCat();
				tv.setCategoria(rs.getString("categoria"));
				tv.setQntd_vendas(rs.getInt("qntd_vendas"));
				tv.setTotal_retornado(rs.getDouble("total_retornado"));
				vendas.add(tv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vendas;
	}

	@Override
	public List<TotVendasMes> pesquisarTotalVendasPMes(int idVendedor) {
		List<TotVendasMes> vendas = new ArrayList<TotVendasMes>();
		try {
			Connection con = ConnectionManager.getInstance().getConnection();
			//String sql = "SELECT * from tbcliente where cpf like ?";
			String sql = "select MONTH(v.datavenda) as mes_venda, COUNT(v.idVenda) as qntd_vendas, ("
					+ "	select sum(it.subTotal) from venda_item as vi"
					+ " inner join item as it on it.idItem = vi.itens_idItem"
					+ " inner join venda as vd on vd.idVenda = vi.venda_idVenda"
					+ " inner join produto as p on p.idProduto = it.produto_idProduto"
					+ " where MONTH(vd.datavenda) = MONTH(v.dataVenda) and p.vendedor_idVendedor = ?"
					+ " group by MONTH(vd.datavenda)) as total_recebido from venda as v group by mes_venda";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, idVendedor);
			ResultSet  rs = stmt.executeQuery();		
			while(rs.next()) {
				TotVendasMes tv = new TotVendasMes();
				tv.setMes_venda(rs.getInt("mes_venda"));
				tv.setQntd_vendas(rs.getInt("qntd_vendas"));
				tv.setTotal_recebido(rs.getDouble("total_recebido"));
				
				vendas.add(tv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vendas;
	}

}
