package br.com.devstore.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/cadastro")
public class ControlCadastro {
	
	@RequestMapping("/")
    public ModelAndView home(HttpServletRequest request, HttpServletResponse response){
		//System.out.println("Tipo usuario: " + request.getSession().getAttribute("tipoUsuario").toString());
        return new ModelAndView("cadastro");
    }

}
