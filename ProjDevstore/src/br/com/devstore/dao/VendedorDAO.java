package br.com.devstore.dao;

import java.util.List;

import br.com.devstore.model.Licenca;
import br.com.devstore.model.Vendedor;

public interface VendedorDAO {

	public boolean inserir(Vendedor vendedor);
	public boolean excluir(Vendedor vendedor);
	public Licenca login(String usuario, String senha);
	public boolean alterar(Vendedor vendedor);
	public List<Vendedor> getAllLicenced();
	public List<Vendedor> getAllRequisit();
	public Vendedor getById(int id);

	
}



