<%@page import="br.com.devstore.model.Cidade"%>
<%@page import="br.com.devstore.model.Estado"%>
<%@page import="br.com.devstore.model.Endereco"%>
<%@page import="br.com.devstore.dao.ClienteDAOImpl"%>
<%@page import="br.com.devstore.dao.ClienteDAO"%>
<%@page import="br.com.devstore.model.Cliente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<title>Perfil cliente</title>
</head>

<%

	ClienteDAO cDAO = new ClienteDAOImpl();

	Cliente c = (Cliente) cDAO.login(request.getParameter("usr").toString(), request.getParameter("senha").toString());
	
	Endereco end = c.getEndereco();
	
	Estado est = end.getEstado();
	
	Cidade cid = end.getCidade();

	request.setAttribute("idCliente", c.getIdCliente());
	request.setAttribute("nomeCliente", c.getNomeCompleto());
	request.setAttribute("usuario", c.getNomeUsuario());
	request.setAttribute("senha", c.getSenha());
	request.setAttribute("cpf", c.getCPF());
	request.setAttribute("email", c.getEmail());
	request.setAttribute("telefone", c.getTelefone());
	request.setAttribute("idEndereco", c.getEndereco().getIdEndereco());
	request.setAttribute("nomeCidade", c.getEndereco().getCidade().getNomeCidade());
	request.setAttribute("endereco", end.getEndereco());
	request.setAttribute("cep", end.getCEP());
	request.setAttribute("idEstado", c.getEndereco().getEstado().getIdEstado());
	request.setAttribute("nomeEstado", c.getEndereco().getEstado().getNomeEstado());
	request.setAttribute("estado", est.getIdEstado());
	request.setAttribute("idCidade", c.getEndereco().getCidade().getIdCidade());
	request.setAttribute("cidade", cid.getIdCidade());

%>

<body style="background-color: #F5F5F5">

	<jsp:include page="header.jsp" />
	
	<!-- conteudo -->
	<div class="container">
		<div class="row-12 justify-content-center">
			<strong><h4 class="card-title mt-5 text-dark">Atualização de perfil</h4></strong>
			<div class="card-body rounded bg-white" style="background-color: #FFFAFA">
				<form id="formCliente" action="./atualizar?idc=${idCliente}&ide=${idEndereco}&idcd=${idCidade}&ides=${idEstado}" method="post">
					<div class="row mb-2">
						<div class="col">
							<input type="text" class="form-control" name="txtNomeCompleto" placeholder="Nome completo" value="${nomeCliente}"/>
						</div>
					</div>
					<div class="row mb-2">
						<div class="col">
							<input type="text" class="form-control" name="txtUsuario" placeholder="Usuario" value="${usuario}"/>
						</div>
						<div class="col">
							<input type="password" class="form-control" name="txtSenha" placeholder="Senha" value="${senha}"/>
						</div>
					</div>
					<div class="row mb-2">
						<div class="col">
							<input type="text" class="form-control" name="txtCPF" placeholder="CPF" value="${cpf}"/>
						</div>
						<div class="col">
							<input type="email" class="form-control" name="txtEmail" placeholder="E-mail" value="${email}"/>
						</div>
					</div>
					<div class="row mb-5">
						<div class="col-6">
							<input type="text" class="form-control" name="txtTelefone" placeholder="Telefone" value="${telefone}"/>
						</div>
					</div>
					<h5>Endereco</h5>
					<hr />
					<div class="row mb-5">
						<div class="col">
							<select id="estado" class="form-control" name="sltEstado">
							    <option value="-1" disabled selected>Estado</option>
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
							<select id="cidade" class="form-control" name="sltCidade">
							    <option value="-1" disabled selected>Cidade</option>
							    <option value="São Paulo">São Paulo</option>
							</select>
						</div>
						<div class="col-6">
							<input type="text" class="form-control" name="txtEndereco" placeholder="Endereço" value="${endereco}"/>
						</div>
						<div class="col">
							<input type="text" class="form-control" name="txtCEP" placeholder="CEP" value="${cep}"/>
						</div>
					</div>
					<div class="row">
						<div class="col justify-content-end">
							<input type="button" value="Cancelar" onclick="location.href='.././'" class="btn btn-danger btn-lg"/>
							<input type="submit" name="cmd" value="Atualizar" class="btn btn-primary btn-lg"/>
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

<script type="text/javascript">
	(function (){
		
		document.getElementById("estado").value = "${nomeCidade}";
		document.getElementById("cidade").value = "${nomeEstado}";
		
	})();
</script>

<%

request.removeAttribute("nomeCliente");
request.removeAttribute("usuario");
request.removeAttribute("senha");
request.removeAttribute("cpf");
request.removeAttribute("email");
request.removeAttribute("telefone");

%>

</html>