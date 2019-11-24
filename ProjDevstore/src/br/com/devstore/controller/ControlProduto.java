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
import br.com.devstore.model.Tag;
import br.com.devstore.model.Tipo;
import br.com.devstore.model.Vendedor;

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
	
	@RequestMapping("/cadastro")
	public ModelAndView cadastro(HttpServletRequest request , HttpServletResponse response) {
		return new ModelAndView("cadastro_produto");
	}
	
	@RequestMapping("/produtos")
    public ModelAndView produtos(HttpServletRequest request, HttpServletResponse response){
		
		return new ModelAndView("tela_manter_produtos");
		
    }
	
	@RequestMapping("/cadastrar")
    public ModelAndView cadastrar(HttpServletRequest request, HttpServletResponse response){
		
		ProdutoDAO pDAO = new ProdutoDAOImpl();
		
		Produto p = new Produto();
		p.setNomeProduto(request.getParameter("txtNomeProduto"));
		p.setPreco(Double.parseDouble(request.getParameter("txtPreco")));
		p.setQntd(Integer.parseInt(request.getParameter("txtQntdProduto")));
		p.setDescricao(request.getParameter("descricao"));
		p.setInformacoes(request.getParameter("informacoes"));
		
		
		System.out.println("TIPO: " + request.getParameter("sltTipo"));
		
		Tipo tp = new Tipo();
		tp.setIdTipo(Integer.parseInt(request.getParameter("sltTipo")));
		
		p.setTipo(tp);
		
		List<Tag> tagsList = new ArrayList<Tag>();
		String[] tags = request.getParameter("tags").split(";");
		
		for(int i=0; i<tags.length; i++){
			Tag t = new Tag();
			t.setNomeTag(tags[i]);
			tagsList.add(t);
		}
		
		p.setTags(tagsList);
		
		Vendedor v = (Vendedor) request.getSession().getAttribute("usuarioLogado");
		
		p.setVendedor(v);
		
		System.out.println("TAMANHO: " + tags.length);
		
		//request.getParameter("txtNomeCompleto");
		
		pDAO.insert(p);
		
		return new ModelAndView("tela_manter_produtos");
		
    }
	
	
	
}
