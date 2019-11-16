package br.com.devstore.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Vendedor {

	private int idVendedor;
	private String nomeCompleto;
	private String razaoSocial;
	private String CNPJ;
	//private Licenca licenca;
	private Long telefone;
	private String email;
	private String CPF;
	private Endereco endereco;
	private boolean isRequisit;
	
	@Id
	public int getIdVendedor() {
		return idVendedor;
	}
	public void setIdVendedor(int idVendedor) {
		this.idVendedor = idVendedor;
	}
	public String getNomeCompleto() {
		return nomeCompleto;
	}
	public void setNomeCompleto(String nomeCompleto) {
		this.nomeCompleto = nomeCompleto;
	}
	public String getRazaoSocial() {
		return razaoSocial;
	}
	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}
	public String getCNPJ() {
		return CNPJ;
	}
	public void setCNPJ(String string) {
		CNPJ = string;
	}
	
	/*
	@OneToOne
	public Licenca getLicenca() {
		return licenca;
	}
	public void setLicenca(Licenca licenca) {
		this.licenca = licenca;
	}*/
	public Long getTelefone() {
		return telefone;
	}
	public void setTelefone(Long telefone) {
		this.telefone = telefone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCPF() {
		return CPF;
	}
	public void setCPF(String cPF) {
		CPF = cPF;
	}
	
	@ManyToOne
	public Endereco getEndereco() {
		return endereco;
	}
	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}
	public boolean isRequisit() {
		return isRequisit;
	}
	public void setRequisit(boolean isRequisit) {
		this.isRequisit = isRequisit;
	}
	
	
	
	
}
