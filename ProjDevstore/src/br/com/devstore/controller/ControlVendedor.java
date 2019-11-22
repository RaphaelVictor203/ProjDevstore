
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
import br.com.devstore.dao.ProdutoDAO;
import br.com.devstore.dao.ProdutoDAOImpl;
import br.com.devstore.dao.VendedorDAO;
import br.com.devstore.dao.VendedorDAOImpl;
import br.com.devstore.model.Cidade;
import br.com.devstore.model.Endereco;
import br.com.devstore.model.Estado;
import br.com.devstore.model.Produto;
import br.com.devstore.model.Vendedor;

@Controller
@RequestMapping("/vendedor")
public class ControlVendedor {

	@RequestMapping("/")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {

		return new ModelAndView("tela_vendedor");

	}

	@RequestMapping("/cadastro")
	public ModelAndView cadastro(HttpServletRequest request, HttpServletResponse response) {

		return new ModelAndView("cadastro_vendedor");

	}

	@RequestMapping("/cadastrar")
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String cadastrar = request.getParameter("btnCadastrar");
		// String msg = "";
		if ("Cadastrar".equals(cadastrar)) {
			try {
				VendedorDAO vendedorDAO = new VendedorDAOImpl();
				if ("Cadastrar".equals(cadastrar)) {

					Vendedor vendedor = new Vendedor();
					vendedor.setNomeCompleto(request.getParameter("txtNomeCompleto"));
					vendedor.setCPF(request.getParameter("txtCPF"));
					vendedor.setRazaoSocial(request.getParameter("txtRazaoSocial"));
					vendedor.setCNPJ(request.getParameter("txtCNPJ"));
					vendedor.setEmail(request.getParameter("txtEmail"));
					vendedor.setTelefone(request.getParameter("txtTelefone"));

					Endereco endereco = new Endereco();
					endereco.setEndereco(request.getParameter("txtLogradouro"));

					Estado estado = new Estado();
					estado.setNomeEstado(request.getParameter("cmbEstado"));

					Cidade cidade = new Cidade();
					cidade.setNomeCidade(request.getParameter("cmbCidade"));

					endereco.setEstado(estado);
					endereco.setCidade(cidade);
					endereco.setCEP(request.getParameter("txtCEP"));

					vendedor.setEndereco(endereco);
					vendedorDAO.inserir(vendedor);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("./cadastro");
		}

	}
=======
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
import br.com.devstore.dao.VendaDAO;
import br.com.devstore.dao.VendaDAOImpl;
import br.com.devstore.dao.VendedorDAO;
import br.com.devstore.dao.VendedorDAOImpl;
import br.com.devstore.model.Cidade;
import br.com.devstore.model.Cliente;
import br.com.devstore.model.Endereco;
import br.com.devstore.model.Estado;
import br.com.devstore.model.Item;
import br.com.devstore.model.Produto;
import br.com.devstore.model.Vendedor;

@Controller
@RequestMapping("/vendedor")
public class ControlVendedor {
  


	@RequestMapping("/")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
  
		return new ModelAndView("tela_vendedor");

	}

	@RequestMapping("/cadastro")
	public ModelAndView cadastro(HttpServletRequest request, HttpServletResponse response) {

		return new ModelAndView("cadastro_vendedor");		
    }
	
	@RequestMapping("/perfil")
    public ModelAndView perfil(HttpServletRequest request, HttpServletResponse response){
		
		return new ModelAndView("perfilVendedor");
		
    }
  
	@RequestMapping("/listarVenda")
	public ModelAndView itensVenda(HttpServletRequest request, HttpServletResponse response){
		
		VendaDAO vDAO =  new VendaDAOImpl();
		
		int id =  Integer.parseInt(request.getParameter("id"));
		
		List<Item> listaItens = vDAO.getItensByIdVenda(id);
		
		request.getSession().setAttribute("itensVenda", listaItens);
		
		request.getSession().setAttribute("idVenda", id);
		
		return new ModelAndView("tela_vendedor");
		
    }
	
	@RequestMapping("/confirmarVenda")
	public ModelAndView confirmarVenda(HttpServletRequest request, HttpServletResponse response){
		
		VendaDAO vDAO =  new VendaDAOImpl();
		
		int id =  Integer.parseInt(request.getParameter("id"));
		
		vDAO.confirmarVenda(id);
		
		request.getSession().setAttribute("itensVenda", null);
		
		return new ModelAndView("tela_vendedor");
		
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

	@RequestMapping("/cadastrar")
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String cadastrar = request.getParameter("btnCadastrar");
		// String msg = "";
		if ("Cadastrar".equals(cadastrar)) {
			try {
				VendedorDAO vendedorDAO = new VendedorDAOImpl();
				if ("Cadastrar".equals(cadastrar)) {

					Vendedor vendedor = new Vendedor();
					vendedor.setNomeCompleto(request.getParameter("txtNomeCompleto"));
					vendedor.setCPF(request.getParameter("txtCPF"));
					vendedor.setRazaoSocial(request.getParameter("txtRazaoSocial"));
					vendedor.setCNPJ(request.getParameter("txtCNPJ"));
					vendedor.setEmail(request.getParameter("txtEmail"));
					vendedor.setTelefone(request.getParameter("txtTelefone"));

					Endereco endereco = new Endereco();
					endereco.setEndereco(request.getParameter("txtLogradouro"));

					Estado estado = new Estado();
					estado.setNomeEstado(request.getParameter("cmbEstado"));

					Cidade cidade = new Cidade();
					cidade.setNomeCidade(request.getParameter("cmbCidade"));

					endereco.setEstado(estado);
					endereco.setCidade(cidade);
					endereco.setCEP(request.getParameter("txtCEP"));

					vendedor.setEndereco(endereco);
					vendedorDAO.inserir(vendedor);

				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("./cadastro");
		}

	}
}