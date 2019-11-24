package br.com.devstore.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.devstore.dao.ClienteDAO;
import br.com.devstore.dao.ClienteDAOImpl;
import br.com.devstore.dao.CupomDAO;
import br.com.devstore.dao.CupomDAOImpl;
import br.com.devstore.dao.ProdutoDAO;
import br.com.devstore.dao.ProdutoDAOImpl;
import br.com.devstore.model.Cidade;
import br.com.devstore.model.Cliente;
import br.com.devstore.model.Cupom;
import br.com.devstore.model.Endereco;
import br.com.devstore.model.Estado;
import br.com.devstore.model.Produto;
import br.com.devstore.model.Tag;
import br.com.devstore.model.Tipo;
import br.com.devstore.model.Vendedor;

@Controller
@RequestMapping("/cupom")
public class ControlCupom {

	@RequestMapping("/cadastrar")
    public ModelAndView cadastrar(HttpServletRequest request, HttpServletResponse response) throws ParseException{
		
		SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
		
		CupomDAO cDAO = new CupomDAOImpl();
		Vendedor v = (Vendedor) request.getSession().getAttribute("usuarioLogado");
		
		Cupom c = new Cupom();
		c.setCodigoCupom(request.getParameter("txtCodigoCupom"));
		c.setQntdDesconto(Integer.parseInt(request.getParameter("txtQntdDesconto")));
		c.setInicioValidade(formato.parse(request.getParameter("txtInicioValidade")));
		c.setFimValidade(formato.parse(request.getParameter("txtFimValidade")));
		c.setVendedor(v);
		
		cDAO.inserir(c);
		
		return new ModelAndView("tela_vendedor");
		
    }
	
	@RequestMapping("/alterar")
    public ModelAndView alterar(HttpServletRequest request, HttpServletResponse response) throws ParseException{
		
		
		SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
		
		CupomDAO cDAO = new CupomDAOImpl();
		Vendedor v = (Vendedor) request.getSession().getAttribute("usuarioLogado");
		
		Cupom c = cDAO.pesquisar(request.getParameter("idC"));
		
		//Cupom c = new Cupom();
		c.setCodigoCupom(request.getParameter("txtCodigoCupom"));
		c.setQntdDesconto(Integer.parseInt(request.getParameter("txtQntdDesconto")));
		c.setInicioValidade(formato.parse(request.getParameter("txtInicioValidade")));
		c.setFimValidade(formato.parse(request.getParameter("txtFimValidade")));
		c.setVendedor(v);
		
		cDAO.alterar(c);
		
		return new ModelAndView("tela_vendedor");
		
    }
	
	@RequestMapping("/excluir")
    public ModelAndView excluir(HttpServletRequest request, HttpServletResponse response) throws ParseException{
		
		CupomDAO cDAO = new CupomDAOImpl();
		
		cDAO.delete(Integer.parseInt(request.getParameter("id")));
		
		return new ModelAndView("tela_vendedor");
		
    }
	
}
