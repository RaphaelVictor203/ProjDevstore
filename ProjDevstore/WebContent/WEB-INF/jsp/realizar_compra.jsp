<%@page import="java.text.NumberFormat"%>
<%@page import="br.com.devstore.model.Carrinho"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.com.devstore.model.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<title>Realizar Compra</title>
</head>

<%
	List<Item> itemList = new ArrayList<Item>();
	
	Carrinho c = new Carrinho();
	
	NumberFormat nf = NumberFormat.getInstance();

	nf.setMaximumFractionDigits(2);
	nf.setMinimumFractionDigits(2);

	if(session.getAttribute("carrinho") != null){
		itemList = (List<Item>) session.getAttribute("carrinho");
		c.setItens(itemList);
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
		c.setItens(itemList);
	}
%>

<body style="background-color: #F5F5F5">

	<jsp:include page="header.jsp" />

	<!-- conteudo -->
	<div class="container">
		<div class="row-12 justify-content-center">
			<strong><h4 class="card-title mt-5 text-dark">Realizar
					Compra</h4></strong>
			<div class="card-body rounded bg-white"
				style="background-color: #FFFAFA; margin-bottom: 10em">
				<strong><h5 class="card-title text-secondary">Itens do carrinho</h5></strong>
				<div class="bg-light rounded mb-1" style="height: 20em; overflow: auto;">
					<%
						for(Item i : itemList){
						      			//session.setAttribute("item", i);
						      			//request.getSession().setAttribute("nomeItem", i.getProduto().getNomeProduto());
						      			//request.getSession().setAttribute("qntdItem", i.getQntdProduto());
					%>
					<div class="card w-100 mb-1">
						<div class="card-body">
							<div class="row">
								<div class="col-3">
									<h5 class="card-title text-left">Produto: <%=i.getProduto().getNomeProduto()%></h5>
								</div>
								<div class="col">
									<h5 class="card-title text-left">Quantidade: <%=i.getQntdProduto()%></h5>
								</div>
								<div class="col">
									<h5 class="card-title text-left">Sub-total: <%=nf.format(i.gtSubTotal()).toString()%></h5>
								</div>
								<div class="col">
									<a href="/ProjDevstore/carrinho/excluir?id=<%=i.getIdItem()%>&lc=0"
										class="btn btn-danger w-50" style="float: right">Excluir</a>
								</div>
							</div>
						</div>
					</div>
					<%
						}
					%>
				</div>
				
				<div class="row bg-secondary my-3">
					<h2 class="text-white ml-3">VALOR TOTAL: R$<%= nf.format(c.gtPrecoTotal()).toString()%></h2>
				</div>
				
				<div class="row">
					<div class="col-6">
					</div>
					<div class="col-6" style="padding-left: 2em; padding-right: 2em;">
					<form action="/ProjDevstore/carrinho/realizarCompra" method="POST">
						<div class="row">
							<h5 class="card-title text-secondary">Forma de pagamento</h5>
						</div>
						<div class="row">
							<div class="col-6">
								<input type="radio" name="formaPagto" value="0"> Cartão de crédito
							</div>
							<div class="col-6">
								<input type="radio" name="formaPagto" value="1"> Cartão de débito
							</div>
						</div>
						<div class="row mt-3">
							<input type="text" class="form-control" name="numCartao" placeholder="Número do Cartão*"/>
						</div>
						<div class="row mt-2 mb-3">
							<input type="text" class="form-control" name="nomeCartao" placeholder="Nome impresso no cartão*"/>
						</div>
						<h6 style="margin-left:-.5em">Validade*</h6>
						<div class="row bg-light">
							<select id="mesValidade" class="form-control w-25" name="sltMesVal">
						    	<option value="-1" disabled selected>MÊS</option>
						    	<option value="1">1</option>
						    	<option value="2">2</option>
						    	<option value="3">3</option>
						    	<option value="4">4</option>
						    	<option value="5">5</option>
						    	<option value="6">6</option>
						    	<option value="7">7</option>
						    	<option value="8">8</option>
						    	<option value="9">9</option>
						    	<option value="10">10</option>
						    	<option value="11">11</option>
						    	<option value="12">12</option>
							</select>
							<select id="anoValidade" class="form-control w-25" name="sltAnoVal">
						    	<option value="-1" disabled selected>ANO</option>
						    	<option value="2019">2019</option>
						    	<option value="2020">2020</option>
						    	<option value="2021">2021</option>
						    	<option value="2022">2022</option>
						    	<option value="2023">2023</option>
						    	<option value="2024">2024</option>
						    	<option value="2025">2025</option>
							</select>
							<input type="text" class="form-control w-50" placeholder="Código de segurança"/>
						</div>
						<div class="row mt-4">
							
								<input type="submit" class="btn-lg btn-success w-100" value="Realizar Compra"/>
							
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

</body>
</html>