package br.com.devstore.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="cidade")
@SequenceGenerator(name = "CID_SEQ", sequenceName = "CIDADE_SEQ", initialValue = 1, allocationSize = 1)
public class Cidade {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "CID_SEQ")
	private int idCidade;
	private String nomeCidade;
	
	public int getIdCidade() {
		return idCidade;
	}
	public void setIdCidade(int idCidade) {
		this.idCidade = idCidade;
	}
	public String getNomeCidade() {
		return nomeCidade;
	}
	public void setNomeCidade(String nomeCidade) {
		this.nomeCidade = nomeCidade;
	}
	
	
	
}
