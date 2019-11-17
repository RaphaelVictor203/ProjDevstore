package br.com.devstore.dao;

import br.com.devstore.model.Venda;

public interface VendaDAO {
	
	public boolean inserir(Venda venda);
	public Venda getVendaByIdVendedor();

}
