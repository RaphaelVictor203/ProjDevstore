<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<title>Gerenciamento Vendedor</title>
</head>

<%

	int tela = -1;

	if(request.getParameter("tl") != null){
		tela = Integer.parseInt(request.getParameter("tl"));	
	}
	
	if(request.getParameter("idP") != null){
		session.setAttribute("idP", request.getParameter("idP"));
	}
	
	if(request.getParameter("idC") != null){
		session.setAttribute("idC", request.getParameter("idC"));
	}

%>

<body style="background-color: #F5F5F5">

	<jsp:include page="header.jsp" />
	
	<% if(tela == 1){ %>
	
		<jsp:include page="tela_pedidos.jsp" />
	
	<%}else
	  if(tela == 2){%>
	  
	  	<jsp:include page="tela_manter_produtos.jsp" />
	  
	<%}else{ %>
	
		<jsp:include page="tela_cupons.jsp" />
	
	<%} %>
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>