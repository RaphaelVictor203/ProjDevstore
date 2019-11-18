<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Novo Vendedor</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous" />
<style>
body {
	background-color: #F5FFFA;
	color: #363636;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<br>
	<div class="container">
		<div class="row-12 justify-content-center">
			<strong>
				<h4 class="card-title mt-5 text-dark">REQUISIÇÃO DE LICENÇA</h4>
			</strong>
			<div class="card-body rounded bg-white"
				style="background-color: #F0FFF0">
				<form id="form_CAD_Vendedor" action="/ProjDevstore/vendedor/cadastrar" method="post">
					<div class="row mb-2">
						<div class=col-8>
							<input type="text" class="form-control" name="txtNomeCompleto"
								placeholder="Digite Seu Nome Completo*" />
						</div>
						<div class=col-4>
							<input type=text class="form-control" name="txtCPF"
								placeholder="Digite o seu CPF*" />
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-8">
							<input type="text" class="form-control" name="txtRazaoSocial"
								placeholder="Digite a sua Razão Social*" />
						</div>
						<div class="col-4">
							<input type="text" class="form-control" name="txtCNPJ"
								placeholder="Digite o CNPJ*" />
						</div>
					</div>
					<div class="row mb-5">
						<div class="col-8">
							<input type="text" class="form-control" name="txtEmail"
								placeholder="Digite o seu email*" />
						</div>

						<div class="col-4">
							<input type="text" class="form-control" name="txtTelefone"
								placeholder="Digite o seu numero de telefone*" />
						</div>
					</div>
					<hr />
					<h4>Endereço</h4>
					<div class="row mb-5">
						<div class="col">
							<select id="estado" class="form-control" name="cmbEstado">
								<option value=-1 disabled selected>Estado</option>
								<option value="AC">Acre</option>
								<option value="AL">Alagoas</option>
								<option value="AP">Amapá</option>
								<option value="AM">Amazonas</option>
								<option value="BA">Bahia</option>
								<option value="CE">Ceará</option>
								<option value="DF">Distrito Federal</option>
								<option value="ES">Espírito Santo</option>
								<option value="GO">Goiás</option>
								<option value="MA">Maranhão</option>
								<option value="MT">Mato Grosso</option>
								<option value="MS">Mato Grosso do Sul</option>
								<option value="MG">Minas Gerais</option>
								<option value="PA">Pará</option>
								<option value="PB">Paraíba</option>
								<option value="PR">Paraná</option>
								<option value="PE">Pernambuco</option>
								<option value="PI">Piauí</option>
								<option value="RJ">Rio de Janeiro</option>
								<option value="RN">Rio Grande do Norte</option>
								<option value="RS">Rio Grande do Sul</option>
								<option value="RO">Rondônia</option>
								<option value="RR">Roraima</option>
								<option value="SC">Santa Catarina</option>
								<option value="SP">São Paulo</option>
								<option value="SE">Sergipe</option>
								<option value="TO">Tocantins</option>
							</select>
						</div>
						<div class="col">
							<select id="cidade" class="form-control" name="cmbCidade">
								<option value=-1 disabled selected>Cidade</option>
								<option value="ANY">Anywhare</option>
							</select>
						</div>

						<div class="col-6">
							<input type="text" class="form-control" name="txtLogradouro"
								placeholder="Digite o seu Logradouro*" />
						</div>

						<div class="col">
							<input type="text" class="form-control" name="txtCEP"
								placeholder="Digite o seu CEP* " />
						</div>
					</div>
					<div class="row mb-5">
						<div class="col justify-contend-end">
							<input type="button" value="Cancelar" onclick="location.href='/ProjDevstore/'" class="btn btn-danger btn-lg"> 
								<input type="submit"
								value="Cadastrar" name="btnCadastrar"
								Class="btn btn-primary btn-lg">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>