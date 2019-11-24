<%@page import="br.com.devstore.model.Tipo"%>
<%@page import="br.com.devstore.model.Tag"%>
<%@page import="br.com.devstore.model.Produto"%>
<%@page import="br.com.devstore.dao.ProdutoDAOImpl"%>
<%@page import="br.com.devstore.dao.ProdutoDAO"%>
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

	boolean alterar = false;

	Produto pr = new Produto();
	Tipo tp = new Tipo();
	tp.setIdTipo(-1);
	pr.setTipo(tp);

	NumberFormat nf = NumberFormat.getInstance();
	
	nf.setMaximumFractionDigits(2);
	nf.setMinimumFractionDigits(2);

	Vendedor v = (Vendedor) session.getAttribute("usuarioLogado");
	
	VendaDAO vDAO = new VendaDAOImpl();
	ProdutoDAO pDAO = new ProdutoDAOImpl();
	
	List<Produto> pList = new ArrayList<Produto>();
	
	pList = pDAO.pesquisarByIdVendedor(v.getIdVendedor());
	
	String tags = "";
	
	if(session.getAttribute("idP") != null){
		pr = pDAO.pesquisarById(Integer.parseInt(session.getAttribute("idP").toString()));
		alterar = true;
		for(Tag t : pr.getTags()){
			tags += t.getNomeTag() + ";";
		}
		session.removeAttribute("idP");
	}

%>

<body style="z-index: -1">
	
	<!-- conteudo -->
	<div class="container">
		<strong><h4 class="card-title mt-5 text-dark">Manter Produtos</h4></strong>
		<div class="row-12 justify-content-center">
			<div class="card-body rounded bg-white"
				style="background-color: #FFFAFA; margin-bottom: 2em">
			<%if(alterar == false){ %>
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
							<select id="tipo" class="form-control" name="sltTipo">
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
			<%}else{ %>
				<form action="/ProjDevstore/produto/alterar?id=<%= pr.getIdProduto() %>" method="post">
				<div class="row w-100 mb-2">
						<div class="col">
							<input type="text" class="form-control" name="txtNomeProduto" placeholder="Nome do Produto" value="<%= pr.getNomeProduto() %>"/>
						</div>
						<div class="col-3">
							<input type="text" class="form-control" name="txtPreco" placeholder="Preço" value="<%= pr.getPreco() %>"/>
						</div>
					</div>
					<div class="row w-100 mb-2">
						<div class="col">
							<input type="text" class="form-control" name="txtQntdProduto" placeholder="Quantidade produto" value="<%= pr.getQntd() %>"/>
						</div>
						<div class="col">
							<select id="tipo" class="form-control" name="sltTipo">
							    <option value="-1" disabled selected>Tipo produto</option>
							    <option value="1">Hardware</option>
								<option value="2">Software</option>
							</select>
						</div>
					</div>
					<div class="row w-100 mb-2">
						<div class="col">
							<h5 class="card-title mt-4 text-dark">Descrição breve sobre o produto: </h5>
							<textarea class="form-control" name="descricao"><%= pr.getDescricao() %></textarea>
						</div>
					</div>
					<div class="row w-100 mb-3">
						<div class="col">
							<h5 class="card-title mt-4 text-dark">Informações técnicas sobre o produto: </h5>
							<textarea class="form-control" name="informacoes"><%= pr.getInformacoes() %></textarea>
						</div>
					</div>
					<div class="row w-100 mb-3">
						<div class="col">
							<h5 class="card-title mt-4 text-dark">Tags de pesquisa: </h5>
							<textarea class="form-control" name="tags"><%= tags %></textarea>
						</div>
					</div>
					<div class="row">
						<div class="col justify-content-end">
							<input type="button" value="Cancelar" onclick="location.href='/ProjDevstore/vendedor/?tl=2'" class="btn btn-danger btn-lg"/>
							<input type="submit" name="cmd" value="Alterar" class="btn btn-primary btn-lg"/>
						</div>
					</div>
				</form>
			<%} %>
					
			</div>
		</div>
		<div class="row-12 justify-content-center mb-5">
			<h5 class="card-title text-dark">Produtos cadastrados: </h5>
			<div class="card-body rounded bg-white"
				style="background-color: #FFFAFA; margin-bottom: 10em; height: 25em"/>
				
				<div class="bg-light rounded mb-1 border border-secondary" style="height: 20em; overflow: auto;">
					<%for(Produto p : pList){%>
						<div class="card w-100 mb-1">
							<div class="card-body">
								<div class="row">
									<div class="col">
										<h5 class="card-title text-center">Nome produto: <%= p.getNomeProduto() %></h5>
									</div>
									<div class="col">
										<h5 class="card-title text-center">Quantidade estoque: <%= p.getQntd() %></h5>
									</div>
									<div class="col">
										<h5 class="card-title text-center">Preço: R$ <%= nf.format(p.getPreco()) %></h5>
									</div>
									<div class="col">
										<a href="/ProjDevstore/vendedor/?tl=2&idP=<%=p.getIdProduto()%>" class="btn btn-primary w-100">Alterar</a>
									</div>
									<div class="col">
										<a href="/ProjDevstore/produto/excluir?id=<%=p.getIdProduto()%>&lc=1" class="btn btn-danger w-100">Excluir</a>
									</div>		
								</div>
							</div>
						</div>
					<%} %>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>

<script type="text/javascript">
	(function (){
		document.getElementById("tipo").value = "<%= pr.getTipo().getIdTipo() %>";	
	})();
</script>

</html>