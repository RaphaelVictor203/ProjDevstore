package br.com.devstore.dao;

import br.com.devstore.model.Vendedor;

public interface VendedorDAO {

	public Vendedor login(String usuario, String senha);
	
}
