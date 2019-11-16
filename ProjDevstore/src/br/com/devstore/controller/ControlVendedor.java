package br.com.devstore.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.devstore.dao.ClienteDAO;
import br.com.devstore.dao.ClienteDAOImpl;
import br.com.devstore.dao.ProdutoDAO;
import br.com.devstore.dao.ProdutoDAOImpl;
import br.com.devstore.dao.VendedorDAO;
import br.com.devstore.dao.VendedorDAOImpl;
import br.com.devstore.model.Cidade;
import br.com.devstore.model.Cliente;
import br.com.devstore.model.Endereco;
import br.com.devstore.model.Estado;
import br.com.devstore.model.Produto;
import br.com.devstore.model.Vendedor;

@Controller
@RequestMapping("/vendedor")
public class ControlVendedor {
	
	@RequestMapping("/")
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response){
		
		return new ModelAndView("tela_vendedor");
		
    }
	
	@RequestMapping("/cadastro")
    public ModelAndView cadastro(HttpServletRequest request, HttpServletResponse response){
		
		return new ModelAndView("cadastro_vendedor");
		
    }
	
	@RequestMapping("/perfil")
    public ModelAndView perfil(HttpServletRequest request, HttpServletResponse response){
		
		return new ModelAndView("perfilVendedor");
		
    }
	
	@RequestMapping("/atualizar")
	protected void doPostAt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			VendedorDAO vDao = new VendedorDAOImpl();
			Vendedor v = new Vendedor();
			v.setIdVendedor(Integer.parseInt(request.getParameter("idv")));
			v.setNomeCompleto(request.getParameter("txtNomeCompleto"));
			v.setCPF(request.getParameter("txtCPF"));
			v.setRazaoSocial(request.getParameter("txtRazaoSocial"));
			v.setCNPJ(request.getParameter("txtCNPJ"));
			v.setEmail(request.getParameter("txtEmail"));
			v.setTelefone(Long.getLong(request.getParameter("txtTelefone")));
			
			Endereco e = new Endereco();
			
			Estado est = new Estado();
			est.setIdEstado(Integer.parseInt(request.getParameter("ides")));
			est.setNomeEstado(request.getParameter("cmbEstado"));
			
			Cidade cid = new Cidade();
			cid.setIdCidade(Integer.parseInt(request.getParameter("idcd")));
			cid.setNomeCidade(request.getParameter("cmbCidade"));
			
			e.setEstado(est);
			e.setCidade(cid);
			e.setIdEndereco(Integer.parseInt(request.getParameter("ide")));
			e.setCEP(request.getParameter("txtCEP"));
			e.setEndereco(request.getParameter("txtLogradouro"));
			
			v.setEndereco(e);
			
			vDao.alterar(v);
				
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.sendRedirect("/ProjDevstore/vendedor/");

	}
	

}
