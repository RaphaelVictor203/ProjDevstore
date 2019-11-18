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
}