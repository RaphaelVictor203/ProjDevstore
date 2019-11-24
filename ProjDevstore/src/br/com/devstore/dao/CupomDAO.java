package br.com.devstore.dao;

import java.util.List;

import br.com.devstore.model.Cupom;

public interface CupomDAO {
	
	public Cupom pesquisar(String codCupom);
	public boolean inserir(Cupom c);
	public boolean alterar(Cupom c);
	public boolean delete(int id);
	public List<Cupom> pesquisarByIdVendedor(int id);

}
