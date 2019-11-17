package br.com.devstore.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.devstore.dao.GerenteDAO;
import br.com.devstore.dao.GerenteDAOImpl;
import br.com.devstore.dao.LicencaDAO;
import br.com.devstore.dao.LicencaDAOImpl;
import br.com.devstore.dao.VendedorDAO;
import br.com.devstore.dao.VendedorDAOImpl;
import br.com.devstore.model.Gerente;
import br.com.devstore.model.Licenca;
import br.com.devstore.model.Vendedor;

@Controller
@RequestMapping("/gerente")
public class ControlGerente {
	
	@RequestMapping("/")
    public ModelAndView home(HttpServletRequest request, HttpServletResponse response){
		//System.out.println("Tipo usuario: " + request.getSession().getAttribute("tipoUsuario").toString());
        return new ModelAndView("tela_gerente");
    }
	
	@RequestMapping("/ativarVend")
	public ModelAndView ativarVend(HttpServletRequest request, HttpServletResponse response){
		//System.out.println("Tipo usuario: " + request.getSession().getAttribute("tipoUsuario").toString());
        return new ModelAndView("ativar_vendedor");
    }
	
	@RequestMapping("/ativar")
	public ModelAndView ativar(HttpServletRequest request, HttpServletResponse response){
		
		VendedorDAO vDAO = new VendedorDAOImpl();
		
		Vendedor v = vDAO.getById(Integer.parseInt(request.getSession().getAttribute("idVendedor").toString()));
		
		v.setRequisit(1);
		
		vDAO.alterar(v);
		
		GerenteDAO gDAO = new GerenteDAOImpl();
		
		Gerente g = gDAO.getById(Integer.parseInt(request.getSession().getAttribute("idGerente").toString()));
		
		Licenca l = new Licenca();
		
		l.setGerente(g);
		l.setVendedor(v);
		l.setSenha(request.getParameter("pass"));
		l.setUsuario(request.getParameter("usr"));
		
		LicencaDAO lDAO = new LicencaDAOImpl();
		
		lDAO.inserir(l);
		
        return new ModelAndView("tela_gerente");
    }

}
