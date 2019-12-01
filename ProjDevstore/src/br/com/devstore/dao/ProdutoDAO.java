package br.com.devstore.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import br.com.devstore.model.Produto;
import br.com.devstore.model.TopVendas;
import br.com.devstore.model.TotVendasCat;
import br.com.devstore.model.TotVendasMes;

public interface ProdutoDAO {

	public List<Produto> pesquisarTodos();
	public Produto pesquisarById(int id);
	public List<Produto> pesquisarByIdVendedor(int id);
	public List<Produto> pesquisaEspecifica(int tipo, int faixa, String nomeProduto);
	public List<TopVendas> pesquisarTop10ProdutosVendidos(int idVendedor);
	public List<TotVendasCat> pesquisarTotalVendasPCategoria(int idVendedor);
	public List<TotVendasMes> pesquisarTotalVendasPMes(int idVendedor);
	public boolean insert(Produto p);
	public boolean alterar(Produto p);
	public boolean delete(int id);
	
}
