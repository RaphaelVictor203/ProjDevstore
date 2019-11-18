package br.com.devstore.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

@Entity
@SequenceGenerator(name = "VND_SEQ", sequenceName = "VENDEDOR_SEQ", initialValue = 1, allocationSize = 1)
public class Vendedor {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "VND_SEQ")
	private int idVendedor;
	private String nomeCompleto;
	private String razaoSocial;
	private String CNPJ;
	//private Licenca lice]nca;
	private String telefone;
	private String email;
	private String CPF;
	@ManyToOne(cascade=CascadeType.ALL, targetEntity=Endereco.class, fetch=FetchType.EAGER)
	@JoinColumn(name = "idEndereco")
	private Endereco endereco;
	

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
	public void setCNPJ(String cNPJ) {
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
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
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
	public Endereco getEndereco() {
		return endereco;
	}
	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

}
