<%@page import="br.com.devstore.model.Item"%>
<%@page import="br.com.devstore.model.Produto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.devstore.model.Vendedor"%>
<%@page import="br.com.devstore.model.Cliente"%>
<%@page import="br.com.devstore.model.Licenca"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<%

	session.setAttribute("dist", 80);

	List<Item> itemList = new ArrayList<Item>();
	
	if(session.getAttribute("carrinho") != null){
		itemList = (List<Item>) session.getAttribute("carrinho");
	}else{
		/*Item i1 = new Item();
		i1.setIdItem(0);
		Produto p = new Produto();
		p.setNomeProduto("Produto 1");
		i1.setProduto(p);
		i1.setQntdProduto(5);
		
		Item i2 = new Item();
		i2.setIdItem(1);
		Produto p2 = new Produto();
		p2.setNomeProduto("Produto 2");
		i2.setProduto(p2);
		i2.setQntdProduto(3);
		
		Item i3 = new Item();
		i3.setIdItem(2);
		Produto p3 = new Produto();
		p3.setNomeProduto("Produto 3");
		i3.setProduto(p3);
		i3.setQntdProduto(2);
		
		Item i4 = new Item();
		i4.setIdItem(3);
		Produto p4 = new Produto();
		p4.setNomeProduto("Produto 4");
		i4.setProduto(p4);
		i4.setQntdProduto(9);
		
		itemList.add(i1);
		itemList.add(i2);
		itemList.add(i3);
		itemList.add(i4);*/

		
		session.setAttribute("carrinho", itemList);
	}

	Cliente c = null;
	Vendedor v = null;
	
	boolean isLogged = false;
	
	if(session.getAttribute("usuarioLogado") == null){
		isLogged = false;
	}else{		
		isLogged = true;
		if(session.getAttribute("tipoUsuario").toString().equals("cliente")){
			c = (Cliente) session.getAttribute("usuarioLogado");
			session.setAttribute("login", c.getNomeUsuario());
			session.setAttribute("senha", c.getSenha());
			session.setAttribute("dist", 74);
		}else{
			Licenca l = new Licenca();
			v = (Vendedor) session.getAttribute("usuarioLogado");
			l = (Licenca) session.getAttribute("licenca");
			session.setAttribute("login", l.getUsuario());
			session.setAttribute("senha", l.getSenha());
			session.setAttribute("dist", 67);
		}
	}
	
%>

<body style="z-index: 10">

	<!-- Menu top -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary w-100">
	  <!-- <a class="navbar-brand" href="/ProjDevstore/">
    	<img src="./pictures/tag_icon.jpg" width="60" height="30" alt="teste" style="background-color: red">
  	  </a> -->
	  <a class="navbar-brand align-middle" href="/ProjDevstore/">DevStore</a>
	  <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
	  <%if(isLogged){ %>
	  <% if(session.getAttribute("tipoUsuario").toString().equals("vendedor")){ %>
	  	<ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" onclick="location.href='/ProjDevstore/vendedor/?tl=2'">Produtos<span class="sr-only">(página atual)</span></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" onclick="location.href='/ProjDevstore/vendedor/?tl=3'">Cupons</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" onclick="location.href='/ProjDevstore/vendedor/?tl=1'">Pedidos</a>
	      </li>
	    </ul>
	  <%}else
	  if(session.getAttribute("tipoUsuario").toString().equals("gerente")){%>
		<ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" href="#">Licencas<span class="sr-only">(página atual)</span></a>
	      </li>
	    </ul> 
	  <%} 
	  }%>
	  <% if(isLogged){%>
		  <div class="row" style="margin-left: ${dist}%">
		  		<%if(session.getAttribute("tipoUsuario").toString().equals("cliente")){%>
		  		<div class="col-6">
		  			<input type="button" value="Carrinho" class="btn btn-outline-light btn-md w-100" data-toggle="modal" data-target="#ModalCarrinho"/>
		  		</div>
		  		 <%}%>
		  		<div class="col-6">
		  			<div class="dropdown w-50">
						  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    Configurações
						  </button>
						  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						  	<% if(session.getAttribute("tipoUsuario").toString().equals("cliente")){ %>
						  		<a class="dropdown-item" onclick="location.href='/ProjDevstore/cliente/perfil?usr=${login}&senha=${senha}'">Atualizar perfil</a>
						  	<% }else{ %>
						  		<a class="dropdown-item" onclick="location.href='/ProjDevstore/vendedor/perfil?usr=${login}&senha=${senha}'">Atualizar perfil</a>
						  	<% } %>
						    <a class="dropdown-item" onclick="location.href='/ProjDevstore/login/logout'">Logout</a>
						  </div>
					</div>
		  		</div>
		  </div>
	  <%}else{ %>
	  	<div class="row" style="margin-left: ${dist}%">
		  		<div class="col-6">
		  			<input type="button" value="Logar" onclick="location.href='/ProjDevstore/login/log?tp=0'" class="btn btn-outline-light btn-md w-100"/>
		  		</div>
		  		<div class="col-6">
		  			<input type="button" value="Cadastrar" onclick="location.href='/ProjDevstore/cadastro/'" class="btn btn-info btn-md"/>
		  		</div>
		  </div>
	  <%} %>
	  </div>
	</nav>

</body>

<!-- Modal -->
<div class="modal fade" id="ModalCarrinho" tabindex="-1" role="dialog" aria-labelledby="TituloModalCentralizado" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="TituloModalCentralizado">Carrinho</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="height: 20em; overflow:auto;">
      	<%for(Item i : itemList){
      			//session.setAttribute("item", i);
      			//request.getSession().setAttribute("nomeItem", i.getProduto().getNomeProduto());
      			//request.getSession().setAttribute("qntdItem", i.getQntdProduto());
      		%>
	       	<div class="card w-100 mb-1 " style="width: 18rem;">
			  <div class="card-body">
			  	<div class="row">
				  	<div class="col-6">
				    	<h5 class="card-title"><%=i.getProduto().getNomeProduto()%></h5>
				    </div>
				    <div class="col-3">
				    	<h5 class="card-title"><%=i.getQntdProduto()%></h5>
				    </div>
					<div class="col">		    
			    		<a href="/ProjDevstore/carrinho/excluir?id=<%=i.getProduto().getIdProduto()%>&lc=1" class="btn btn-danger">Excluir</a>
			    	</div>
			    </div>
			  </div>
			</div>
		<%}%>
      </div>
      <div class="modal-footer">
        <button type="button" onclick="location.href='/ProjDevstore/carrinho/compra'" class="btn btn-success w-100">Realizar compra</button>
      </div>
    </div>
  </div>
</div>

</html>