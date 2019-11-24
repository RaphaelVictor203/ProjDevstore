<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.com.devstore.dao.CupomDAOImpl"%>
<%@page import="br.com.devstore.dao.CupomDAO"%>
<%@page import="br.com.devstore.model.Cupom"%>
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
	<title>Cupons</title>
</head>

<%

	boolean alterar = false;

	SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
	
	Cupom cp = new Cupom();

	NumberFormat nf = NumberFormat.getInstance();
	
	nf.setMaximumFractionDigits(2);
	nf.setMinimumFractionDigits(2);

	Vendedor v = (Vendedor) session.getAttribute("usuarioLogado");
	
	CupomDAO cDAO = new CupomDAOImpl();
	
	List<Cupom> cList = new ArrayList<Cupom>();
	
	cList = cDAO.pesquisarByIdVendedor(v.getIdVendedor());
	
	String tags = "";
	
	String dataInicio = "";
	String dataFim = "";
	if(request.getParameter("idC") != null){
		cp = cDAO.pesquisar(request.getParameter("idC").toString());
		alterar = true;
		session.removeAttribute("idC");
		dataInicio = ((cp.getInicioValidade().getYear() + 1900) + "-" + (cp.getInicioValidade().getMonth() + 1) + "-" + cp.getInicioValidade().getDate());
		dataFim = ((cp.getFimValidade().getYear() + 1900) + "-" + (cp.getFimValidade().getMonth() + 1) + "-" + cp.getFimValidade().getDate());
		System.out.println("CODIGO CUPOM" + request.getParameter("idC").toString());
		System.out.println("DATA INICIO" + dataInicio);
		System.out.println("DATA FIM" + dataFim);
	}

%>

<body>
	
	<!-- conteudo -->
	<div class="container">
		<strong><h4 class="card-title mt-5 text-dark">Manter Cupons</h4></strong>
		<div class="row-12 justify-content-center">
			<div class="card-body rounded bg-white"
				style="background-color: #FFFAFA; margin-bottom: 2em">
			<%if(alterar == false){ %>
				<form action="/ProjDevstore/cupom/cadastrar" method="post">
				<div class="row w-100 mb-2">
						<div class="col">
							<input type="text" class="form-control" name="txtCodigoCupom" placeholder="Código do cupom"/>
						</div>
						<div class="col-3">
							<input type="number" class="form-control" name="txtQntdDesconto" placeholder="Valor do desconto"/>
						</div>
					</div>
					<div class="row w-100 mb-2">
						<div class="col">
							<input type="date" class="form-control" name="txtInicioValidade" placeholder="Inicio da validade"/>
						</div>
						<div class="col">
							<input type="date" class="form-control" name="txtFimValidade" placeholder="Fim da validade"/>
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
				<form action="/ProjDevstore/cupom/alterar?idC=<%= request.getParameter("idC") %>" method="post">
				<div class="row w-100 mb-2">
						<div class="col">
							<input type="text" class="form-control" name="txtCodigoCupom" placeholder="Código do cupom" value="<%= cp.getCodigoCupom() %>"/>
						</div>
						<div class="col-3">
							<input type="number" class="form-control" name="txtQntdDesconto" placeholder="Valor do desconto" value="<%= cp.getQntdDesconto() %>"/>
						</div>
					</div>
					<div class="row w-100 mb-2">
						<div class="col">
							<input type="date" class="form-control" name="txtInicioValidade" placeholder="Inicio da validade"  value="<%= dataInicio%>"/>
						</div>
						<div class="col">
							<input type="date" class="form-control" name="txtFimValidade" placeholder="Fim da validade"  value="<%= dataFim%>"/>
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
			<h5 class="card-title text-dark">Cupons cadastrados: </h5>
			<div class="card-body rounded bg-white"
				style="background-color: #FFFAFA; margin-bottom: 10em; height: 25em"/>
				
				<div class="bg-light rounded mb-1 border border-secondary" style="height: 20em; overflow: auto;">
					<%for(Cupom c : cList){%>
						<div class="card w-100 mb-1">
							<div class="card-body">
								<div class="row">
									<div class="col">
										<h5 class="card-title text-center">Código Cupom: <%= c.getCodigoCupom() %></h5>
									</div>
									<div class="col">
										<h5 class="card-title text-center">Valor desconto: <%= c.getQntdDesconto() %></h5>
									</div>
									<div class="col">
										<a href="/ProjDevstore/vendedor/?tl=3&idC=<%=c.getCodigoCupom()%>" class="btn btn-primary w-100">Alterar</a>
									</div>
									<div class="col">
										<a href="/ProjDevstore/cupom/excluir?id=<%=c.getIdCupom()%>&lc=1" class="btn btn-danger w-100">Excluir</a>
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

</html>