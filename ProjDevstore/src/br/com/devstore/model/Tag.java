package br.com.devstore.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Tag {

	private int idTag;
	private String nomeTag;
	
	@Id 
	public int getIdTag() {
		return idTag;
	}
	public void setIdTag(int idTag) {
		this.idTag = idTag;
	}
	public String getNomeTag() {
		return nomeTag;
	}
	public void setNomeTag(String nomeTag) {
		this.nomeTag = nomeTag;
	}
	
	
	
}
