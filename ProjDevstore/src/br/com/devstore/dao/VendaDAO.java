package br.com.devstore.dao;

import java.util.List;

import br.com.devstore.model.Item;
import br.com.devstore.model.Venda;

public interface VendaDAO {
	
	public boolean inserir(Venda venda);
	public List<Venda> getVendaByIdVendedor(int id);
	public List<Item> getItensByIdVenda(int id);
	public boolean confirmarVenda(int id);

}
