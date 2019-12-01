package br.com.devstore.model;

public class TopVendas {
	
	private String nomeProduto;
	private int qntd_vendas;
	private double total_retornado;
	
	public String getNomeProduto() {
		return nomeProduto;
	}
	public void setNomeProduto(String nomeProduto) {
		this.nomeProduto = nomeProduto;
	}
	public int getQntd_vendas() {
		return qntd_vendas;
	}
	public void setQntd_vendas(int qntd_vendas) {
		this.qntd_vendas = qntd_vendas;
	}
	public double getTotal_retornado() {
		return total_retornado;
	}
	public void setTotal_retornado(double total_retornado) {
		this.total_retornado = total_retornado;
	}

	
	
}
