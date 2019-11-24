<%@page import="java.text.NumberFormat"%>
<%@page import="br.com.devstore.model.Item"%>
<%@page import="br.com.devstore.model.Vendedor"%>
<%@page import="br.com.devstore.dao.VendaDAOImpl"%>
<%@page import="br.com.devstore.dao.VendaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.devstore.model.Venda"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<title></title>
</head>

<%

	NumberFormat nf = NumberFormat.getInstance();
	
	nf.setMaximumFractionDigits(2);
	nf.setMinimumFractionDigits(2);

	Vendedor v = (Vendedor) session.getAttribute("usuarioLogado");

	List<Venda> listaVendas = new ArrayList<Venda>();
	List<Item> listaItens = new ArrayList<Item>();
	
	VendaDAO vDAO = new VendaDAOImpl();
	
	listaVendas = vDAO.getVendaByIdVendedor(v.getIdVendedor());
	
	if(session.getAttribute("itensVenda") != null){
		listaItens = (List<Item>) session.getAttribute("itensVenda");
	}

%>

<body>
	
	<!-- conteudo -->
	<div class="container">
		<strong><h4 class="card-title mt-5 text-dark">Lista de pedidos</h4></strong>
		<div class="row-12 justify-content-center">
			<div class="card-body rounded bg-white"
				style="background-color: #FFFAFA; margin-bottom: 2em">
				
				<div class="bg-light rounded mb-1 border border-secondary" style="height: 20em; overflow: auto;">
					<%for(Venda vd : listaVendas){ %>
						<div class="card w-100 mb-1">
							<div class="card-body">
								<div class="row">
									<div class="col">
										<h5 class="card-title text-center">Id Venda: <%= vd.getIdVenda() %></h5>
									</div>
									<div class="col">
										<h5 class="card-title text-center">Data pedido: <%= vd.getDataVenda() %></h5>
									</div>
									<div class="col">
										<a onclick="location.href='/ProjDevstore/vendedor/listarVenda?id=<%= vd.getIdVenda() %>'"
											class="btn btn-success mr-3" style="float: right">Listar itens</a>
									</div>
								</div>
							</div>
						</div>
					<%} %>
					
				</div>
			</div>
		</div>
		<div class="row-12 justify-content-center mb-5">
			<h5 class="card-title text-dark">Itens da lista: </h5>
			<div class="card-body rounded bg-white"
				style="background-color: #FFFAFA; margin-bottom: 10em; height: 25em"/>
				
				<div class="bg-light rounded mb-1 border border-secondary" style="height: 20em; overflow: auto;">
					<%for(Item it : listaItens){%>
						<div class="card w-100 mb-1">
							<div class="card-body">
								<div class="row">
									<div class="col">
										<h5 class="card-title text-center">Item: <%= it.getProduto().getNomeProduto() %></h5>
									</div>
									<div class="col">
										<h5 class="card-title text-center">Quantidade: <%= it.getQntdProduto() %></h5>
									</div>
									<div class="col">
										<h5 class="card-title text-center">Subtotal: R$ <%= nf.format(it.getSubTotal()) %></h5>
									</div>	
								</div>
							</div>
						</div>
					<%} %>
				</div>
				<a onclick="location.href='/ProjDevstore/vendedor/confirmarVenda?id=${idVenda}'"
											class="btn btn-success w-100" style="float: right">Confirmar pedido</a>
			</div>
		</div>
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>