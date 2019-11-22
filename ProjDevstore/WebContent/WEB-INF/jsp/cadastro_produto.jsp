<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Novo Produto</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="WebContent/WEB-INF/scripts/bootstrap-tagsinput.css" />
<script type="text/javascript"
	src="WebContent/WEB-INF/scripts/bootstrap-tagsinput.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous" />

<style>
body {
	background-color: rgb(237, 237, 237);
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
				<h4 class="card-title mt-5 text-dark">CONTROLE DE PRODUTOS</h4>
			</strong>
			<div class="card border-grey mb-2" style="max-width: 100%;">
				<div class="card-body rounded"
					style="background-color: rgb(237, 237, 237)">
					<form id="form_CAD_Produto" action="" method="post">

						<div class="row mb-2">
							<div class="col 8">
								<input type="text" class="form-control" name="txtNome"
									placeholder="Digite o nome do produto" />
							</div>
						</div>
						<div class="row mb-2">
							<div class="col 8">
								<input type="text" class="form-control" name="txtDescricao"
									placeholder="Digite a descrição do produto" />
							</div>
						</div>
						<div class="row mb-2">
							<div class="col 4">
								<select id="tipo" class="form-control" name="cmbTipo">
									<option value=-1 disabled selected>Tipo</option>
									<option value="Some">Something</option>
								</select>
							</div>
							<div class="col 4">
								<input type="text" class="form-control" name="txtPreco"
									placeholder="Informe o valor do produto" />

							</div>
						</div>
						<hr />
						<h4>Informações</h4>
						<div class="row mb-2">
							<div class="col 6">
								<textarea class="form-control" id="txtInfos" rows="5"
									placeholder="Descreva Informações do Produto"></textarea>
							</div>
						</div>
						<div class="row mb-2">
							<div class="col 6">
								<input type="text" class="form-control" name="txtTags"
									data-role="tagsinput" placeholder="Adicionar tag" />
							</div>
						</div>
					</form>

				</div>
			</div>
			<div class="row mb-2">
				<div class="col justify-content-end">
					<input type="button" value="Cancelar"
						onclick="location.href='/ProjDevstore/'"
						class="btn btn-danger btn-lg" /> <input type="submit"
						value="Cadastrar" name="btnCadastrar"
						class="btn btn-primary btn-lg" />
				</div>
			</div>
		</div>

	</div>
</body>
</html>