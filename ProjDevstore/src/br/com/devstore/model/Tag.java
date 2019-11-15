package br.com.devstore.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Tag {

	private int idTag;
	private String nomeTag;
	
	@Id 
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "CLI_SEQ")
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
