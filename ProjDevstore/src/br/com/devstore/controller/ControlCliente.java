package br.com.devstore.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.devstore.dao.ClienteDAO;
import br.com.devstore.dao.ClienteDAOImpl;
import br.com.devstore.dao.EnderecoDAO;
import br.com.devstore.dao.EnderecoDAOImpl;
import br.com.devstore.model.Cidade;
import br.com.devstore.model.Cliente;
import br.com.devstore.model.Endereco;
import br.com.devstore.model.Estado;

@Controller
@RequestMapping("/cliente")
public class ControlCliente extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@RequestMapping("/cadastro")
    public ModelAndView home(HttpServletRequest request, HttpServletResponse response){
		//System.out.println("Tipo usuario: " + request.getSession().getAttribute("tipoUsuario").toString());
        return new ModelAndView("cadastro_cliente");
    }
	
	@RequestMapping("/cadastrar")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		String msg = null;
		//HttpSession session = request.getSession();
		try {
			ClienteDAO cDao = new ClienteDAOImpl();
			//EnderecoDAO eDao = new EnderecoDAOImpl();
			if ("Cadastrar".equals(cmd)) {
				Cliente c = new Cliente();
				c.setNomeCompleto(request.getParameter("txtNomeCompleto"));
				c.setNomeUsuario(request.getParameter("txtUsuario"));
				c.setSenha(request.getParameter("txtSenha"));
				c.setCPF(request.getParameter("txtCPF"));
				c.setEmail(request.getParameter("txtEmail"));
				c.setTelefone(Long.parseLong(request.getParameter("txtTelefone")));
				
				Endereco e = new Endereco();
				
				Estado est = new Estado();
				est.setNomeEstado(request.getParameter("sltEstado"));
				//est.setNomeEstado("São Paulo 2");
				
				Cidade cid = new Cidade();
				cid.setNomeCidade(request.getParameter("sltCidade"));
				//cid.setNomeCidade("São Paulo 3");
				
				e.setEstado(est);
				e.setCidade(cid);
				e.setCEP(request.getParameter("txtCEP"));
				e.setEndereco(request.getParameter("txtEndereco"));
				
				c.setEndereco(e);
				
				//eDao.inserir(e);
				cDao.inserir(c);
				
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.sendRedirect("./cadastro");

	}
	
	@RequestMapping("/perfil")
    public ModelAndView perfil(HttpServletRequest request, HttpServletResponse response){
		//System.out.println("Tipo usuario: " + request.getSession().getAttribute("tipoUsuario").toString());
        return new ModelAndView("perfilCliente");
    }
	
	@RequestMapping("/atualizar")
	protected void doPostAt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			ClienteDAO cDao = new ClienteDAOImpl();
			Cliente c = new Cliente();
			c.setIdCliente(Integer.parseInt(request.getParameter("idc")));
			c.setNomeCompleto(request.getParameter("txtNomeCompleto"));
			c.setNomeUsuario(request.getParameter("txtUsuario"));
			c.setSenha(request.getParameter("txtSenha"));
			c.setCPF(request.getParameter("txtCPF"));
			c.setEmail(request.getParameter("txtEmail"));
			c.setTelefone(Integer.parseInt(request.getParameter("txtTelefone")));
			
			Endereco e = new Endereco();
			
			Estado est = new Estado();
			est.setIdEstado(Integer.parseInt(request.getParameter("ides")));
			est.setNomeEstado(request.getParameter("sltEstado"));
			
			Cidade cid = new Cidade();
			cid.setIdCidade(Integer.parseInt(request.getParameter("idcd")));
			cid.setNomeCidade(request.getParameter("sltCidade"));
			
			e.setEstado(est);
			e.setCidade(cid);
			e.setIdEndereco(Integer.parseInt(request.getParameter("ide")));
			e.setCEP(request.getParameter("txtCEP"));
			e.setEndereco(request.getParameter("txtEndereco"));
			
			c.setEndereco(e);
			
			cDao.alterar(c);
				
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.sendRedirect("../");

	}
	
}

