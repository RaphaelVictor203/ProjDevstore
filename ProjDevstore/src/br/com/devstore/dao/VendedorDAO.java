package br.com.devstore.dao;

import br.com.devstore.model.Vendedor;

public interface VendedorDAO {

	public Vendedor login(String usuario, String senha);
	public boolean inserir(Vendedor vendedor);
	public boolean alterar(Vendedor vendedor);
	public boolean excluir(Vendedor vendedor);
	
}



