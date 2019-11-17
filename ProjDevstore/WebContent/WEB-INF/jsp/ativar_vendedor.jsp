<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>Ativar Licenca</title>
</head>

<%
	
	session.setAttribute("idVendedor", request.getParameter("id"));
	session.setAttribute("idGerente", request.getParameter("idg"));
	
%>

<body style="background-color: #F5F5F5">

	<jsp:include page="header.jsp" />
	
	<!-- conteudo -->
	<div class="container">
		<div class="col-md-6" style="margin:0 auto;">
			<strong><h4 class="card-title mt-5 text-center">Ativar Licenca</h4></strong>
			<div class="card-body rounded bg-white py-5" style="margin:0 auto;">
				<form id="formLogin" action="/ProjDevstore/gerente/ativar" method="post">
					<div class="row">
						<div class="col">
							<input type="text" name="usr" class="form-control w-100 mb-3" placeholder="Login"/>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<input type="password" name="pass" class="form-control w-100 mb-3" placeholder="Password"/>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<input type="submit" value="Ativar Licenca" class="btn btn-success btn-lg w-100"/>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- Modal Esqueci minha senha  -->


<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Recuperação de senha</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         
         <form>
		  <div class="form-group">
		    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Digite seu CPF/CNPJ">
		  </div>
		  <button type="submit" class="btn btn-success btn-lg btn-block" data-dismiss="modal">Enviar</button>
        </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn  btn-danger" data-dismiss="modal">Voltar</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->	
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>