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
	private int CNPJ;
	//private Licenca licenca;
	private int telefone;
	private String email;
	private int CPF;
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
	public int getCNPJ() {
		return CNPJ;
	}
	public void setCNPJ(int cNPJ) {
		CNPJ = cNPJ;
	}
	
	/*
	@OneToOne
	public Licenca getLicenca() {
		return licenca;
	}
	public void setLicenca(Licenca licenca) {
		this.licenca = licenca;
	}*/
	public int getTelefone() {
		return telefone;
	}
	public void setTelefone(int telefone) {
		this.telefone = telefone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCPF() {
		return CPF;
	}
	public void setCPF(int cPF) {
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
