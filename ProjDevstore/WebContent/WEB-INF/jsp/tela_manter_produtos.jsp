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
	<title>Produtos</title>
</head>

<%

	NumberFormat nf = NumberFormat.getInstance();
	
	nf.setMaximumFractionDigits(2);
	nf.setMinimumFractionDigits(2);

	Vendedor v = (Vendedor) session.getAttribute("usuarioLogado");
	
	VendaDAO vDAO = new VendaDAOImpl();

%>

<body style="background-color: #F5F5F5">
	
	<!-- conteudo -->
	<div class="container">
		<strong><h4 class="card-title mt-5 text-dark">Manter Produtos</h4></strong>
		<div class="row-12 justify-content-center">
			<div class="card-body rounded bg-white"
				style="background-color: #FFFAFA; margin-bottom: 2em">
				
				<form action="/ProjDevstore/produto/cadastrar" method="post">
					<div class="row w-100 mb-2">
						<div class="col">
							<input type="text" class="form-control" name="txtNomeProduto" placeholder="Nome do Produto"/>
						</div>
						<div class="col-3">
							<input type="text" class="form-control" name="txtPreco" placeholder="Preço"/>
						</div>
					</div>
					<div class="row w-100 mb-2">
						<div class="col">
							<input type="text" class="form-control" name="txtQntdProduto" placeholder="Quantidade produto"/>
						</div>
						<div class="col">
							<select id="estado" class="form-control" name="sltTipo">
							    <option value="-1" disabled selected>Tipo produto</option>
							    <option value="1">Hardware</option>
								<option value="2">Software</option>
							</select>
						</div>
					</div>
					<div class="row w-100 mb-2">
						<div class="col">
							<h5 class="card-title mt-4 text-dark">Descrição breve sobre o produto: </h5>
							<textarea class="form-control" name="descricao"></textarea>
						</div>
					</div>
					<div class="row w-100 mb-3">
						<div class="col">
							<h5 class="card-title mt-4 text-dark">Informações técnicas sobre o produto: </h5>
							<textarea class="form-control" name="informacoes"></textarea>
						</div>
					</div>
					<div class="row w-100 mb-3">
						<div class="col">
							<h5 class="card-title mt-4 text-dark">Tags de pesquisa: </h5>
							<textarea class="form-control" name="tags"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="col justify-content-end">
							<input type="button" value="Cancelar" onclick="location.href='/ProjDevstore/vendedor/?tl=2'" class="btn btn-danger btn-lg"/>
							<input type="submit" name="cmd" value="Cadastrar" class="btn btn-primary btn-lg"/>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="row-12 justify-content-center mb-5">
			<h5 class="card-title text-dark">Produtos cadastrados: </h5>
			<div class="card-body rounded bg-white"
				style="background-color: #FFFAFA; margin-bottom: 10em; height: 25em"/>
				
				<div class="bg-light rounded mb-1 border border-secondary" style="height: 20em; overflow: auto;">
					
				</div>
				<a onclick="location.href='/ProjDevstore/vendedor/confirmarVenda?id='"
											class="btn btn-success w-100" style="float: right">Confirmar pedido</a>
			</div>
		</div>
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>