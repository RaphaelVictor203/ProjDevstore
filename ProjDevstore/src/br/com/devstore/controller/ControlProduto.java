package br.com.devstore.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.devstore.dao.ProdutoDAO;
import br.com.devstore.dao.ProdutoDAOImpl;
import br.com.devstore.model.Produto;

@Controller
@RequestMapping("/produto")
public class ControlProduto {

	@RequestMapping("/pesquisa")
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response){
		
		ProdutoDAO pDAO = new ProdutoDAOImpl();
		
		List<Produto> produtos = new ArrayList<Produto>();
		try{
			produtos = pDAO.pesquisaEspecifica(Integer.parseInt(request.getParameter("sltTipo")), 
										   Integer.parseInt(request.getParameter("sltFaixa")), 
										   request.getParameter("txtProduto"));
		}catch(Exception e){
			e.getStackTrace();
		}
		
		request.getSession().setAttribute("produtos", produtos);
		
		return new ModelAndView("tela_pesquisa");
    }
	
}
