package br.com.devstore.dao;

import br.com.devstore.model.Licenca;
import br.com.devstore.model.Vendedor;

public interface VendedorDAO {

	public Licenca login(String usuario, String senha);
	public boolean alterar(Vendedor vendedor);
	
}
