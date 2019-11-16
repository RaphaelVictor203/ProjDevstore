package br.com.devstore.model;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Venda {

	private int idVenda;
	private List<Item> itens;
	private Cliente cliente;
	private Date dataVenda;
	private String formaPagto;
	private boolean status;
	
	@Id 
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "CLI_SEQ")
	public int getIdVenda() {
		return idVenda;
	}
	public void setIdVenda(int idVenda) {
		this.idVenda = idVenda;
	}
	
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	public List<Item> getItens() {
		return itens;
	}
	public void setItens(List<Item> items) {
		this.itens = items;
	}
	
	@ManyToOne
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	
	public Date getDataValidade() {
		return dataVenda;
	}
	public void setDataValidade(Date dataValidade) {
		this.dataVenda = dataValidade;
	}
	public String getFormaPagto() {
		return formaPagto;
	}
	public void setFormaPagto(String formaPagto) {
		this.formaPagto = formaPagto;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	
	
	
}
