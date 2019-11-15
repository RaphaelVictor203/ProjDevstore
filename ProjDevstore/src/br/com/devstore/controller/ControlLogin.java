package br.com.devstore.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.devstore.dao.ClienteDAO;
import br.com.devstore.dao.ClienteDAOImpl;
import br.com.devstore.dao.VendedorDAO;
import br.com.devstore.dao.VendedorDAOImpl;
import br.com.devstore.model.Cidade;
import br.com.devstore.model.Cliente;
import br.com.devstore.model.Endereco;
import br.com.devstore.model.Estado;
import br.com.devstore.model.Vendedor;

@Controller
@RequestMapping("/login")
public class ControlLogin {

	@RequestMapping("/log")
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response){
		ModelAndView md;
		if(request.getParameter("tp").equals("1")){
			md = new ModelAndView("login_pt2");
		}else{
			md = new ModelAndView("login");
		}
		
		request.getSession().setAttribute("tpl", request.getParameter("tpl"));
		
		return md;
    }
	
	////logout
	@RequestMapping("/logout")
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response){
		
		request.getSession().removeAttribute("usuarioLogado");
		request.getSession().removeAttribute("tipoUsuario");
		request.getSession().removeAttribute("carrinho");
		
		return new ModelAndView("login");
    }
	
	@RequestMapping("/check")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("TPL: " + request.getParameter("tpl"));
		
		String rst = "";
		
		ClienteDAO cDao = null;
		VendedorDAO vDao = null;
		
//		/request.getSession().setAttribute("titulo", request.getParameter("titulo")
		HttpSession session = request.getSession();
		try {
			
			rst = request.getParameter("tpl");
			
			if(rst.equals("0")){
				cDao = new ClienteDAOImpl();
				Cliente c = cDao.login(request.getParameter("usr"),
						request.getParameter("pass"));
				if(c != null){
					//request.getSession().setAttribute("teste", "vendedor");
					session.setAttribute("usuarioLogado", c);
					session.setAttribute("tipoUsuario", "cliente");
					response.sendRedirect("../");
				}else{
					response.sendRedirect("./log?tp=1&tpl=0");
				}				
			}else{
				vDao = new VendedorDAOImpl();
				Vendedor v = vDao.login(request.getParameter("usr"),
						request.getParameter("pass"));
				if(v != null){
					//request.getSession().setAttribute("teste", "vendedor");
					session.setAttribute("usuarioLogado", v);
					session.setAttribute("tipoUsuario", "vendedor");
					response.sendRedirect("../vendedor/");
				}else{
					response.sendRedirect("./log?tp=1&tpl=1");
				}	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}	
	
}
