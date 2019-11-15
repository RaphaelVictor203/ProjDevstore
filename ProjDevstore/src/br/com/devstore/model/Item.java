package br.com.devstore.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Item {

	private int idItem;
	private int qntdProduto;
	private Produto produto;
	
	@Id
	public int getIdItem() {
		return idItem;
	}
	public void setIdItem(int idItem) {
		this.idItem = idItem;
	}
	public int getQntdProduto() {
		return qntdProduto;
	}
	public void setQntdProduto(int qntdProduto) {
		this.qntdProduto = qntdProduto;
	}
	
	@ManyToOne
	public Produto getProduto() {
		return produto;
	}
	public void setProduto(Produto produto) {
		this.produto = produto;
	}
	
	
	
	
}
