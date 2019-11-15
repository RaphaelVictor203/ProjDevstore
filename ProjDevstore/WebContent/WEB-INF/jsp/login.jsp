
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>Login</title>
</head>
<body style="background-color: #F5F5F5">

	<jsp:include page="header.jsp" />
	
	<!-- conteudo -->
	<div class="container">
		<div class="col-md-6" style="margin:0 auto;">
			<strong><h4 class="card-title mt-5 text-center">Login</h4></strong>
			<div class="card-body rounded bg-white py-5" style="margin:0 auto;">
				<div class="row">
					<div class="col">
						<input type="button" onclick="location.href='./log?tp=1&tpl=0'" value="Logar como cliente" class="btn btn-primary btn-lg w-100 mb-3"/>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col">
						<input type="button" onclick="location.href='./log?tp=1&tpl=1'" value="Logar como vendedor" class="btn btn-info btn-lg w-100"/>
					</div>
				</div>
				<div class="row">
					<div class="col text-center">
						<button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#exampleModalCenter">
                        Esqueci Minha Senha
                     </button>
					</div>
				</div>
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