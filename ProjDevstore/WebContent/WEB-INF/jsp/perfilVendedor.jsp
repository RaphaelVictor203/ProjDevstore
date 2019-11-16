<%@page import="br.com.devstore.model.Vendedor"%>
<%@page import="br.com.devstore.model.Licenca"%>
<%@page import="br.com.devstore.model.Cidade"%>
<%@page import="br.com.devstore.model.Estado"%>
<%@page import="br.com.devstore.model.Endereco"%>
<%@page import="br.com.devstore.dao.VendedorDAOImpl"%>
<%@page import="br.com.devstore.dao.VendedorDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Perfil Vendedor</title>
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

<%

	VendedorDAO vDAO = new VendedorDAOImpl();

	Licenca l = new Licenca();
	Vendedor v = new Vendedor();
	
	l = vDAO.login(request.getParameter("usr").toString(), request.getParameter("senha").toString());
	
	v = l.getVendedor();
	
	Endereco end = v.getEndereco();
	
	Estado est = end.getEstado();
	
	Cidade cid = end.getCidade();
	
	session.setAttribute("nomeCidade", cid.getNomeCidade());
	session.setAttribute("nomeEstado", est.getNomeEstado());
	
	request.setAttribute("idVendedor", v.getIdVendedor());
	request.setAttribute("idEstado", v.getEndereco().getEstado().getIdEstado());
	request.setAttribute("idCidade", v.getEndereco().getCidade().getIdCidade());
	request.setAttribute("idEndereco", v.getEndereco().getIdEndereco());

%>

<body>
	<jsp:include page="header.jsp" />
	<br>
	<div class="container">
		<div class="row-12 justify-content-center">
			<strong>
				<h4 class="card-title mt-5 text-dark">Atualização de perfil</h4>
			</strong>
			<div class="card-body rounded bg-white"
				style="background-color: #F0FFF0">
				<form id="formPerfilVendedor" action="./atualizar?idv=${idVendedor}&ide=${idEndereco}&idcd=${idCidade}&ides=${idEstado}" method="post">
					<div class="row mb-2">
						<div class=col-8>
							<input type="text" class="form-control" name="txtNomeCompleto"
								placeholder="Digite Seu Nome Completo*" value="<%= v.getNomeCompleto()%>"/>
						</div>
						<div class=col-4>
							<input type=text class="form-control" name="txtCPF"
								placeholder="Digite o seu CPF*" value="<%= v.getCPF()%>"/>
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-8">
							<input type="text" class="form-control" name="txtRazaoSocial"
								placeholder="Digite a sua Razão Social*" value="<%= v.getRazaoSocial()%>"/>
						</div>
						<div class="col-4">
							<input type="text" class="form-control" name="txtCNPJ"
								placeholder="Digite o CNPJ*" value="<%= v.getCNPJ()%>"/>
						</div>
					</div>
					<div class="row mb-5">
						<div class="col-8">
							<input type="text" class="form-control" name="txtEmail"
								placeholder="Digite o seu email*" value="<%= v.getEmail()%>"/>
						</div>

						<div class="col-4">
							<input type="text" class="form-control" name="txtTelefone"
								placeholder="Digite o seu numero de telefone*" value="<%= v.getTelefone()%>"/>
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
							<select id="cidade" class="form-control" name="cmbCidade" >
								<option value=-1 disabled selected>Cidade</option>
								<option value="São Paulo">São Paulo</option>
							</select>
						</div>

						<div class="col-6">
							<input type="text" class="form-control" name="txtLogradouro"
								placeholder="Digite o seu Logradouro*" value="<%= end.getEndereco()%>"/>
						</div>

						<div class="col">
							<input type="text" class="form-control" name="txtCEP"
								placeholder="Digite o seu CEP* " value="<%= end.getCEP()%>"/>
						</div>
					</div>
					<div class="row mb-5">
						<div class="col justify-contend-end">
						<input type="button" value="Cancelar" onclick="location.href='/ProjDevstore/'" class="btn btn-danger btn-lg">
							<input type="submit" value="Atualizar" name="btnAtualizar" Class="btn btn-primary btn-lg">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	(function (){
		
		document.getElementById("estado").value = "${nomeEstado}";
		document.getElementById("cidade").value = "${nomeCidade}";
		
	})();
</script>

</html>