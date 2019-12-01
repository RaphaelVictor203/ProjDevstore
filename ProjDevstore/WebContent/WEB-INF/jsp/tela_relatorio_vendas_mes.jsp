<%@page import="br.com.devstore.model.TotVendasMes"%>
<%@page import="br.com.devstore.model.TotVendasCat"%>
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
	
	Vendedor v = (Vendedor) session.getAttribute("usuarioLogado");

	ProdutoDAO pDAO = new ProdutoDAOImpl();
	
	NumberFormat nf = NumberFormat.getInstance();
	
	nf.setMaximumFractionDigits(2);
	nf.setMinimumFractionDigits(2);
	
	List<TotVendasMes> vendas = new ArrayList<TotVendasMes>();
	
	vendas = pDAO.pesquisarTotalVendasPMes(v.getIdVendedor());

%>

<body style="z-index: -1">
	
	<strong><h4 class="card-title mt-5 text-dark">Total de vendas por mês</h4></strong>
	<div class="row-12 justify-content-center mb-5">
		<table class="table table-striped bg-white border">
			  <thead>
			    <tr>
			      <th scope="col" class="text-center">Mês</th>
			      <th scope="col" class="text-center">Quantidade de vendas</th>
			      <th scope="col" class="text-center">Total retornado</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<%
			  	for(TotVendasMes tvs : vendas){%>
				    <tr>
				      <td class="text-center"><%= tvs.getMes_venda() %></td>
				      <td class="text-center"><%= tvs.getQntd_vendas() %></td>
				      <td class="text-center">R$ <%= nf.format(tvs.getTotal_recebido()) %></td>
				    </tr>
				<%
			  	} %>
			  </tbody>
		</table>
	</div>
	
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>