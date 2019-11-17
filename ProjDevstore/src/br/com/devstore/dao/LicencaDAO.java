package br.com.devstore.dao;

import br.com.devstore.model.Licenca;

public interface LicencaDAO {
	
	public boolean inserir(Licenca licenca);
	public Licenca getByIdVendedor(int id);
	public boolean excluir(Licenca l);

}
