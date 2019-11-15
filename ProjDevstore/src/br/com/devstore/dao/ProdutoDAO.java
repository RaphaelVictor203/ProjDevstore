package br.com.devstore.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import br.com.devstore.model.Produto;

public interface ProdutoDAO {

	public List<Produto> pesquisarTodos();
	public Produto pesquisarById(int id);
	public List<Produto> pesquisaEspecifica(int tipo, int faixa, String nomeProduto);
	
}
