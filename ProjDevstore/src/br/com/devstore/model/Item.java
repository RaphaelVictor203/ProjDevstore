package br.com.devstore.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Item {

	private int idItem;
	private int qntdProduto;
	private Produto produto;
	private boolean cupomUtil;
	private double subTotal = -1;
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "CLI_SEQ")
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
	
	public double gtSubTotal(){
		if(this.subTotal == -1){
			this.subTotal = (this.qntdProduto * this.produto.getPreco());
			return this.subTotal;
		}else{
			return this.subTotal;
		}
	}
	public boolean isCupomUtil() {
		return cupomUtil;
	}
	public void setCupomUtil(boolean cupomUtil) {
		this.cupomUtil = cupomUtil;
	}
	public double getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(double subTotal) {
		this.subTotal = subTotal;
	}
	
	public void aplicarCupom(double porcentagemCupom){
		if(!this.cupomUtil){
			this.subTotal = this.subTotal - (this.subTotal * (porcentagemCupom/100));
			this.cupomUtil = true;
		}
	}
	
	
}
