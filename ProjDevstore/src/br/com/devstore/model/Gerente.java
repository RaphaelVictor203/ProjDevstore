package br.com.devstore.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Gerente {

	private int idGerente;
	private String usuario;
	private String senha;
	
	@Id
	public int getIdGerente() {
		return idGerente;
	}
	public void setIdGerente(int idGerente) {
		this.idGerente = idGerente;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	
	
}
