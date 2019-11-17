<%@page import="java.util.List"%>
<%@page import="br.com.devstore.model.Vendedor"%>
<%@page import="br.com.devstore.dao.VendedorDAO"%>
<%@page import="br.com.devstore.dao.VendedorDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<title>Gerenciamento</title>
</head>

<%

	VendedorDAO vDAO = new VendedorDAOImpl();

	List<Vendedor> listaWithLicenca = new ArrayList<Vendedor>();
	listaWithLicenca = (List<Vendedor>) vDAO.getAllLicenced();
	
	List<Vendedor> listaWithoutLicenca = new ArrayList<Vendedor>();
	listaWithoutLicenca = (List<Vendedor>) vDAO.getAllRequisit();
	
	

%>

<body style="background-color: #F5F5F5">

	<jsp:include page="header.jsp" />
	
	<!-- conteudo -->
	<div class="container">
		<div class="row-12 justify-content-center">
			<strong><h4 class="card-title mt-5 text-dark">Pedidos de licenças</h4></strong>
			<div class="card-body rounded bg-white" style="background-color: #FFFAFA; height: 25em; overflow: auto;">
				<%for(Vendedor v : listaWithoutLicenca){ %>
				<div class="card w-100 mb-1">
						<div class="card-body">
							<div class="row">
								<div class="col">
									<h5 class="card-title text-left">Vendedor: <%= v.getNomeCompleto() %></h5>
								</div>
								<div class="col">
									<h5 class="card-title text-left">Razão Social: <%= v.getRazaoSocial() %></h5>
								</div>
								<div class="col">
									<a href="#"
										class="btn btn-info" style="float: right">Info.</a>
									<a onclick="location.href='/ProjDevstore/gerente/ativarVend?id=<%= v.getIdVendedor() %>&idg=<%= 1 %>'"
										class="btn btn-success mr-3" style="float: right" data-toggle="modal" data-target="#licencaModal" 
										>Ativar Licenca</a>
								</div>
							</div>
						</div>
					</div>
				<%} %>
			</div>
			
			<strong><h4 class="card-title mt-5 text-dark">Licenças ativas</h4></strong>
			<div class="card-body rounded bg-white mb-5" style="background-color: #FFFAFA; height: 25em; overflow: auto;">
				<%for(Vendedor v : listaWithLicenca){ %>
				<div class="card w-100 mb-1">
						<div class="card-body">
							<div class="row">
								<div class="col">
									<h5 class="card-title text-left">Vendedor: <%= v.getNomeCompleto() %></h5>
								</div>
								<div class="col">
									<h5 class="card-title text-left">Razão Social: <%= v.getRazaoSocial() %></h5>
								</div>
								<div class="col">
									<a href="#"
										class="btn btn-danger mr-3" style="float: right">Excluir Licenca</a>
								</div>
							</div>
						</div>
					</div>
				<%} %>
			</div>
		</div>
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>

</html>