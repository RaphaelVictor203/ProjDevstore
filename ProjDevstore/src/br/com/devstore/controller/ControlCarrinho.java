package br.com.devstore.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.devstore.dao.ProdutoDAO;
import br.com.devstore.dao.ProdutoDAOImpl;
import br.com.devstore.dao.VendaDAO;
import br.com.devstore.dao.VendaDAOImpl;
import br.com.devstore.model.Carrinho;
import br.com.devstore.model.Cliente;
import br.com.devstore.model.Item;
import br.com.devstore.model.Produto;
import br.com.devstore.model.Venda;

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
			if(i.getProduto().getIdProduto() == id) {
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
		
		//item.setIdItem(p.getIdProduto());
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
    public ModelAndView compra(HttpServletRequest request, HttpServletResponse response) throws IOException{
		return new ModelAndView("realizar_compra");
    }
	
	@RequestMapping("/realizarCompra")
    public void realizarCompra(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		VendaDAO vDAO = new VendaDAOImpl();
		
		List<Item> items = (List<Item>) request.getSession().getAttribute("carrinho");
		
		Carrinho c = new Carrinho();
		
		//c.setItens(items);
		c.setCliente((Cliente) request.getSession().getAttribute("usuarioLogado"));
		
		Venda v = new Venda();
		
		v.setItens(items);
		v.setCliente(c.getCliente());
		v.setFormaPagto(request.getParameter("formaPagto"));
		v.setStatus(false);
		
		Date d = new Date();

		Calendar cal = GregorianCalendar.getInstance();
		
		v.setDataValidade(cal.getTime());
		
		vDAO.inserir(v);
		request.getSession().setAttribute("carrinho", null);
		
		response.sendRedirect("./compra");
		//return new ModelAndView("realizar_compra");
    }
	
	
}
