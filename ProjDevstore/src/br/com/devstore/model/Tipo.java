package br.com.devstore.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Tipo {

	private int idTipo;
	private String nomeTipo;
	
	@Id
	public int getIdTipo() {
		return idTipo;
	}
	public void setIdTipo(int idTipo) {
		this.idTipo = idTipo;
	}
	public String getNomeTipo() {
		return nomeTipo;
	}
	public void setNomeTipo(String nomeTipo) {
		this.nomeTipo = nomeTipo;
	}
	
	
	
}
