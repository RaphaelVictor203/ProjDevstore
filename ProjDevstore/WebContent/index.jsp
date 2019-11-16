

<%@page import="java.text.NumberFormat"%>
<%@page import="br.com.devstore.dao.ProdutoDAOImpl"%>
<%@page import="br.com.devstore.dao.ProdutoDAO"%>
<%@page import="java.util.*"%>
<%@page import="br.com.devstore.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>DevStore - Bem Vindo Dev :)</title>
</head>

<%

	NumberFormat nf = NumberFormat.getInstance();
	
	nf.setMaximumFractionDigits(2);
	nf.setMinimumFractionDigits(2);

	ProdutoDAO pDAO = new ProdutoDAOImpl();
	List<Produto> produtoList = new ArrayList<Produto>();
	produtoList = pDAO.pesquisarTodos();
	
	//List<Produto> produtoList = new ArrayList<Produto>();
	
	//List<Produto> produtoList = new ArrayList<Produto>();
	
	/*Produto p = new Produto();
	p.setNomeProduto("Produto 1");
	
	Produto p2 = new Produto();
	p2.setNomeProduto("Produto 2");
	
	Produto p3 = new Produto();
	p3.setNomeProduto("Produto 3");
	
	Produto p4 = new Produto();
	p4.setNomeProduto("Produto 4");
	
	
	
	produtoList.add(p);
	produtoList.add(p2);
	produtoList.add(p3);
	produtoList.add(p4);*/
	
	
	
	//request.setAttribute("produtos", produtoList);
	//request.setAttribute("produtos", produtoList);

%>

<body style="background-color: #F5F5F5">

	<jsp:include page="/WEB-INF/jsp/header.jsp" />

	<!-- conteudo -->
	<div class="container">
		<div class="row-12 mb-5">
			<div id="carousel" class="carousel slide bg-secondary" data-ride="carousel" style="height: 26em;">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img class="d-block w-100 h-100" src=".../800x400?auto=yes&bg=777&fg=555&text=Primeiro Slide" alt="Primeiro Slide">
			    </div>
			    <div class="carousel-item">
			      <img class="d-block w-100 h-100" src=".../800x400?auto=yes&bg=666&fg=444&text=Segundo Slide" alt="Segundo Slide">
			    </div>
			    <div class="carousel-item">
			      <img class="d-block w-100 h-100" src=".../800x400?auto=yes&bg=555&fg=333&text=Terceiro Slide" alt="Terceiro Slide">
			    </div>
			  </div>
			</div>
		</div>
		<div class="row-12">
			<form id="formPesquisaProduto" action="./produto/pesquisa" method="post">
				<div class="row">
					<div class="col">
						<select id="tipoProduto" class="form-control w-100" name="sltTipo">
						    <option value="-1" disabled selected>Tipo</option>
						    <option value="1">Hardware</option>
						    <option value="2">Software</option>
						</select>
					</div>
					<div class="col">
						<select id="fabricante" class="form-control w-100" name="sltEstado">
						    <option value="-1" disabled selected>Fabricante</option>
						    <option value="1">Microsoft</option>
						    <option value="2">IBM</option>
						</select>
					</div>
					<div class="col">
						<select id="faixaValor" class="form-control w-100" name="sltFaixa">
						    <option value="-1" disabled selected>Faixa de preço</option>
						    <option value="0">Menos de 500</option>
						    <option value="1">De 100 á 500</option>
						    <option value="2">De 500 á 1000</option>
						    <option value="3">Mais de 1000</option>
						    <option value="4">Qualquer</option>
						</select>
					</div>
					<div class="col-6">
						<input type="text" class="form-control w-100" name="txtProduto" placeholder="Nome do Produto"/>
					</div>
					<div class="col">
						<input type="submit" value="Pesquisar" class="btn btn-primary btn-md w-100"/>
					</div>
				</div>
			</form>
		</div>
		<div class="row-12">
			<strong><h4 class="card-title mt-5 text-dark">Produtos em destaque</h4></strong>
		</div>
		<div class="d-flex row-12" style="flex-wrap: wrap; padding-left: .1em">
		
			<% 
				if(produtoList.size() > 0){
					for(Produto pr : produtoList){ 
							request.setAttribute("nomeProduto", pr.getNomeProduto());
							//request.setAttribute("fabricante", pr.getFabricante());
							request.setAttribute("preco", pr.getPreco());%>
						<div class="card mb-3" style="width: 17rem; float: left; margin-left: .30em">
						  <img class="card-img-top" src=".../100px180/" alt=" " style="width: 100%; height: 18em; background-color: gray">
						  <div class="card-body">
						  	<div class="row mb-1">
						  		<div class="col">
						    		<a href="#"><h5 class="card-title">${nomeProduto}</h5></a>
						    	</div>
						    	<div class="col">
						    		<h5 class="card-text text-secondary text-right">R$ <%= nf.format(pr.getPreco())%></h5>
						    	</div>
						    </div>
						    <div class="row">
						    	<div class="col">
						    		<div class="input-group">
						    		
						    		  <form action="/ProjDevstore/carrinho/adicionar?id=<%= pr.getIdProduto() %>&lc=0" method="POST">
						    		  	<div class="row">
						    		  		<div class="w-50 pl-3">
										  		<input type="text" class="form-control w-100" name="qntdProd" id="qntdProd" placeholder="Quantidade"/>
										  	</div>
										  	<div class="w-50 pr-3 pl-1">
											    <input type="submit" class="btn btn-success w-100" value="Adicionar"/>
										  	</div>
										</div>
										<!-- Three values - border-radius: 15px 50px 30px; (first value applies to top-left corner, second value applies to top-right and bottom-left corners, and third value applies to bottom-right corner) -->
									  </form>
									</div>
								</div>
						    </div>
						  </div>
						</div>
						
			<%}} 
				request.removeAttribute("nomeProduto");
				request.removeAttribute("preco");
			%>			
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>