package br.com.devstore.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Cupom {

	private int idCupom;
	private String codigoCupom;
	private int qntdDesconto;
	private Date inicioValidade;
	private Date fimValidade;
	private Vendedor vendedor;
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "CLI_SEQ")
	public int getIdCupom() {
		return idCupom;
	}
	public void setIdCupom(int idCupom) {
		this.idCupom = idCupom;
	}
	
	public String getCodigoCupom() {
		return codigoCupom;
	}
	public void setCodigoCupom(String codigoCupom) {
		this.codigoCupom = codigoCupom;
	}
	public int getQntdDesconto() {
		return qntdDesconto;
	}
	public void setQntdDesconto(int qntdDesconto) {
		this.qntdDesconto = qntdDesconto;
	}
	public Date getInicioValidade() {
		return inicioValidade;
	}
	public void setInicioValidade(Date inicioValidade) {
		this.inicioValidade = inicioValidade;
	}
	public Date getFimValidade() {
		return fimValidade;
	}
	public void setFimValidade(Date fimValidade) {
		this.fimValidade = fimValidade;
	}
	
	@ManyToOne
	public Vendedor getVendedor() {
		return vendedor;
	}
	public void setVendedor(Vendedor vendedor) {
		this.vendedor = vendedor;
	}
	
	
	
}
