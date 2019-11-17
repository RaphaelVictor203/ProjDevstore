package br.com.devstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import br.com.devstore.model.Item;
import br.com.devstore.model.Produto;
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

	@Override
	public List<Venda> getVendaByIdVendedor(int id) {
		List<Venda> listaVendas = new ArrayList<Venda>();
		try {
			Connection con = ConnectionManager.getInstance().getConnection();
			//String sql = "SELECT * from tbcliente where cpf like ?";
			String sql = "select DISTINCT v.idVenda, v.dataVenda from venda_item as vi " +
						"inner join item as i on vi.itens_idItem = i.idItem " +
						"inner join produto as p on p.idProduto = i.produto_idProduto " +
						"inner join venda as v on vi.venda_idVenda = v.idVenda " +
						"inner join vendedor as vend on p.vendedor_idVendedor = vend.idVendedor " +
						"where vend.idVendedor = ? and v.status = 0";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet  rs = stmt.executeQuery();		
			while(rs.next()) {
				Venda v = new Venda();
				v.setIdVenda(rs.getInt("idVenda"));
				v.setDataVenda(rs.getDate("dataVenda"));
				listaVendas.add(v);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listaVendas;
	}

	@Override
	public List<Item> getItensByIdVenda(int id) {
		List<Item> listaItens = new ArrayList<Item>();
		try {
			Connection con = ConnectionManager.getInstance().getConnection();
			//String sql = "SELECT * from tbcliente where cpf like ?";
		String sql = "select i.idItem, i.qntdProduto, i.subTotal, p.idProduto, p.nomeProduto from venda_item as vi " +
						"inner join item as i on vi.itens_idItem = i.idItem " +
						"inner join produto as p on p.idProduto = i.produto_idProduto " +
						"inner join venda as v on vi.venda_idVenda = v.idVenda " +
						"inner join vendedor as vend on p.vendedor_idVendedor = vend.idVendedor " +
						"where v.idVenda = ?";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, id);
			ResultSet  rs = stmt.executeQuery();		
			while(rs.next()) {
				Item i = new Item();
				
				i.setIdItem(rs.getInt("idItem"));
				i.setQntdProduto(rs.getInt("qntdProduto"));
				i.setSubTotal(rs.getDouble("subTotal"));
				
				Produto p = new Produto();
				p.setIdProduto(rs.getInt("idProduto"));
				p.setNomeProduto(rs.getString("nomeProduto"));
				
				i.setProduto(p);
				
				listaItens.add(i);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listaItens;
	}
	
	@Override
	public boolean confirmarVenda(int id){
		try {
			Connection con = ConnectionManager.getInstance().getConnection();
			String query = "update venda set status = 1 where idVenda = ?";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setInt(1, id);
			stmt.executeUpdate();
			con.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}
