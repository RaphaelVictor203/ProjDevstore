package br.com.devstore.dao;

import java.util.ArrayList;

import org.springframework.data.repository.CrudRepository;

import br.com.devstore.model.Cliente;

public interface ClienteDAO{

	public ArrayList<Cliente> pesquisar(Cliente cliente);
	public Cliente pesquisarById(int id);
	public boolean inserir(Cliente cliente);
	public boolean alterar(Cliente cliente);
	public boolean excluir(int idCliente);
	public Cliente login(String user, String senha);
	
}
