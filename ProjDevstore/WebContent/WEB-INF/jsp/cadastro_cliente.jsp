<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<title>Cadastro cliente</title>
</head>
<body style="background-color: #F5F5F5">

	<jsp:include page="header.jsp" />
	
	<!-- conteudo -->
	<div class="container">
		<div class="row-12 justify-content-center">
			<strong><h4 class="card-title mt-5 text-dark">CADASTRO DE CLIENTE</h4></strong>
			<div class="card-body rounded bg-white" style="background-color: #FFFAFA">
				<form id="formCliente" action="/ProjDevstore/cliente/cadastrar" method="post">
					<div class="row mb-2">
						<div class="col">
							<input type="text" class="form-control" name="txtNomeCompleto" placeholder="Nome completo"/>
						</div>
					</div>
					<div class="row mb-2">
						<div class="col">
							<input type="text" class="form-control" name="txtUsuario" placeholder="Usuario"/>
						</div>
						<div class="col">
							<input type="password" class="form-control" name="txtSenha" placeholder="Senha"/>
						</div>
					</div>
					<div class="row mb-2">
						<div class="col">
							<input type="text" class="form-control" name="txtCPF" placeholder="CPF"/>
						</div>
						<div class="col">
							<input type="email" class="form-control" name="txtEmail" placeholder="E-mail"/>
						</div>
					</div>
					<div class="row mb-5">
						<div class="col-6">
							<input type="text" class="form-control" name="txtTelefone" placeholder="Telefone"/>
						</div>
					</div>
					<h5>Endereco</h5>
					<hr />
					<div class="row mb-5">
						<div class="col">
							<select id="estado" class="form-control" name="sltEstado">
							    <option value="-1" disabled selected>Estado</option>
							    <option value="São Paulo">São Paulo</option>
							</select>
						</div>
						<div class="col">
							<select id="cidade" class="form-control" name="sltCidade">
							    <option value="-1" disabled selected>Cidade</option>
							    <option value="São Paulo">São Paulo</option>
							</select>
						</div>
						<div class="col-6">
							<input type="text" class="form-control" name="txtEndereco" placeholder="Endereço"/>
						</div>
						<div class="col">
							<input type="text" class="form-control" name="txtCEP" placeholder="CEP"/>
						</div>
					</div>
					<div class="row">
						<div class="col justify-content-end">
							<input type="button" value="Cancelar" onclick="location.href='/ProjDevstore/'" class="btn btn-danger btn-lg"/>
							<input type="submit" name="cmd" value="Cadastrar" class="btn btn-primary btn-lg"/>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
</body>
</html>