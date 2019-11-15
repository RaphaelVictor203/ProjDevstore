package br.com.devstore.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="estado", schema="devstore")
@SequenceGenerator(name = "EST_SEQ", sequenceName = "ESTADO_SEQ", initialValue = 1, allocationSize = 1)
public class Estado {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "EST_SEQ")
	private int idEstado;
	private String nomeEstado;
	
	public int getIdEstado() {
		return idEstado;
	}
	public void setIdEstado(int idEstado) {
		this.idEstado = idEstado;
	}
	public String getNomeEstado() {
		return nomeEstado;
	}
	public void setNomeEstado(String nomeEstado) {
		this.nomeEstado = nomeEstado;
	}
	
	
	
}
