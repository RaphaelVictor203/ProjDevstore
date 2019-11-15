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

}
