package br.com.devstore.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.devstore.dao.ProdutoDAO;
import br.com.devstore.dao.ProdutoDAOImpl;
import br.com.devstore.model.Item;
import br.com.devstore.model.Produto;

@Controller
@RequestMapping("/carrinho")
public class ControlCarrinho {

	@RequestMapping("/excluir")
    public void excluir(HttpServletRequest request, HttpServletResponse response) throws IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		int lc = Integer.parseInt(request.getParameter("lc"));

		List<Item> itens = (List<Item>) request.getSession().getAttribute("carrinho");
		itens.remove(getItemById(itens, id));
		request.getSession().setAttribute("carrinho", itens);
		
		if(lc == 0){
			response.sendRedirect("/ProjDevstore/carrinho/compra");
		}else{
			response.sendRedirect("../");
		}

    }
	
	private Item getItemById(List<Item> itens, int id) {
		Item it = new Item();
		for(Item i : itens) {
			if(i.getIdItem() == id) {
				return i;
			}
		}
		return it;
	}
	
	@RequestMapping("/adicionar")
    public void adicionar(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		int lc = Integer.parseInt(request.getParameter("lc"));
		
		int id = Integer.parseInt(request.getParameter("id"));
		int qntd= Integer.parseInt(request.getParameter("qntdProd"));
		List<Item> itens = (List<Item>) request.getSession().getAttribute("carrinho");
		
		ProdutoDAO pDAO = new ProdutoDAOImpl();
		Produto p = new Produto();
		p = pDAO.pesquisarById(id);
		
		Item item = new Item();
		
		item.setIdItem(p.getIdProduto());
		item.setProduto(p);
		item.setQntdProduto(qntd);
		
		itens.add(item);
		request.getSession().setAttribute("carrinho", itens);
		
		if(lc == 0){
			response.sendRedirect("../");
		}else{
			response.sendRedirect("../produto/pesquisa");
		}
    }
	
	@RequestMapping("/compra")
    public ModelAndView realizarCompra(HttpServletRequest request, HttpServletResponse response) throws IOException{
		return new ModelAndView("realizar_compra");
    }
	
	
}
