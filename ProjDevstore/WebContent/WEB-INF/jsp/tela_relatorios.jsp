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
<%@page import="br.com.devstore.model.TopVendas"%>
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
	
	int tr = 0;
	if(request.getParameter("tr") != null){
		tr = Integer.parseInt(request.getParameter("tr").toString());
	}

%>

<body style="z-index: -1">
	
	<!-- conteudo -->
	<div class="container">
		<div class="row mt-5">
			<div class="col-3">
				<input type="button" value="TOP 10 Vendas" onclick="location.href='/ProjDevstore/vendedor/?tl=4&tr=1'" class="btn btn-outline-primary w-100 rounded-0"/>
			</div>
			<div class="col-3">
				<input type="button" value="Tot. itens vendidos p/ Categoria" onclick="location.href='/ProjDevstore/vendedor/?tl=4&tr=2'" class="btn btn-outline-primary w-100 rounded-0"/>
			</div>
			<div class="col-3">
				<input type="button" value="Total de vendas p/ MÊS" onclick="location.href='/ProjDevstore/vendedor/?tl=4&tr=3'" class="btn btn-outline-primary w-100 rounded-0"/>
			</div>
			<div class="col-3">
				<input type="button" value="..." onclick="location.href='/ProjDevstore/vendedor/?tl=4&tr=4'" class="btn btn-outline-primary w-100 rounded-0"/>
			</div>
		</div>
		
		<%if(tr == 1){ %>
			
			<jsp:include page="tela_relatorio_top_vendas.jsp" />
			
		<%}else
		  if(tr == 2){%>
		  
		  	<jsp:include page="tela_relatorio_vendas_categoria.jsp" />
		 
		<%}else
		  if(tr == 3){%>
		  
		  	<jsp:include page="tela_relatorio_vendas_mes.jsp" />
		  
		<%} %>
		
	</div>
	
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>