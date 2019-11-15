package br.com.devstore.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Carrinho {

	private int idCarrinho;
	private List<Item> itens;
	private Cliente cliente;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getIdCarrinho() {
		return idCarrinho;
	}
	public void setIdCarrinho(int idCarrinho) {
		this.idCarrinho = idCarrinho;
	}
	@OneToMany
	@JoinTable(name="carrinho_item",
	   joinColumns={@JoinColumn(name="idCarrinho")},
	   inverseJoinColumns={@JoinColumn(name="idItem")})
	public List<Item> getItens() {
		return itens;
	}
	public void setItens(List<Item> itens) {
		this.itens = itens;
	}
	@ManyToOne
	@JoinTable(name="carrinho_cliente",
	   joinColumns={@JoinColumn(name="idCarrinho")},
	   inverseJoinColumns={@JoinColumn(name="idCliente")})
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	
	public double gtPrecoTotal(){
		double preco = 0;
		for(Item i : itens){
			preco += i.gtSubTotal();
		}
		return preco;
	}
	
	
}
