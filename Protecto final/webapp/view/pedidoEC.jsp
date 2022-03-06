<%@page import="model.Provincia"%>
<%@page import="dao.ProvinciaDAOEC"%>
<%@page import="dao.LocalidadDAOEC"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Localidad"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<head>
	<title>Title</title>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS v5.0.2 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>

<body class="bg-light text-center">
	<div class="container">
		<div class="py-4">
			<img src="images/logo.jpg" alt="Logo de Codo a Codo" class="mb-4" width="72" height="72">
			<h3>Formulario de pedido</h3>
			<p class="lead">Ingrese los datos del pedido</p>
		</div>

		<div class="col-md-12">
			<form action="../controller/guardarPedidoEC.jsp">
				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="nombre">Nombre</label>
						<input type="text" name="nombre" id="nombre" required class="form-control" placeholder="Ingrese su nombre">
					</div>
					<div class="col-md-6 mb-3">
						<label for="apellido">Apellido</label>
						<input type="text" name="apellido" id="apellido" required class="form-control" placeholder="Ingrese su apellido">
					</div>
				</div>

				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="usuario">Nombre de Usuario</label>
						<div class="input-group mb-3">
							<span class="input-group-text" id="basic-addon1">@</span>
							<input type="text" name="usuario" id="usuario" required class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
						</div>						
					</div>
					<div class="col-md-6 mb-3">
						<label for="email">Email <span class="text-muted">(Opcional)</span></label>
						<input type="email" name="email" id="email" class="form-control" placeholder="Ingrese su e-mail">
					</div>
				</div>

				<div class="row">
					<div class="col-md-12 mb-3">
						<label for="direccion">Lugar de entrega</label>
						<input type="text" name="direccion" id="direccion" required class="form-control" placeholder="Ingrese la direcci�n de entrega del pedido">
					</div>
				</div>

				<div class="row">
					<div class="col-md-4 mb-3">
						<div class="mb-3">
							<label for="localidad">Localidad</label>
							<select class="form-select" name="localidad" id="localidad">
								<option selected>Seleccione una localidad</option>
								<% 
								LocalidadDAOEC localidadDAO = new LocalidadDAOEC();
								List<Localidad> listLocalidades = localidadDAO.listarLocalidades();
								
								for(int i=0; i < listLocalidades.size(); i++) {
									out.println("<option value='" + listLocalidades.get(i).getId() + "'>" + listLocalidades.get(i).getNombre() + "</option>");
								}	
								%>
							</select>
						</div>
					</div>

					<div class="col-md-4 mb-3">
						<div class="mb-3">
						  <label for="provincia">Provincia</label>
						  <select class="form-select" name="provincia" id="provincia">
							<% 
							ProvinciaDAOEC provinciaDAO = new ProvinciaDAOEC();
							List<Provincia> listProvincias = provinciaDAO.listarProvincias();
							
							for(int i=0; i < listProvincias.size(); i++ ) {
								out.println("<option value='" + listProvincias.get(i).getId() + "'>" + listProvincias.get(i).getNombre() + "</option>");
							}
								
							
							%>
						  </select>
						</div>
					</div>

					<div class="col-md-4 mb-3">
						<label for="codPostal">C�digo Postal</label>
						<input type="text" name="codPostal" id="codPostal" class="form-control" required placeholder="Ingrese su c�digo postal">
					</div>
				</div>

				<hr class="mb-6">

				<h4 class="mb-3">Formas de Pago</h4>

				<div class="row">
					<div class="form-check form-check-inline">
						<label class="form-check-label">
							<input class="form-check-input" type="radio" name="formaPago" id="formaPago" value="tarjeta" checked> Tarjeta de Crédito
						</label>
						<br>
						<label class="form-check-label">
							<input class="form-check-input" type="radio" name="formaPago" id="formaPago" value="mercado"> Mercado Pago
						</label>
					
					</div>

				</div>

				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="titular">Nombre del Titular</label>
						<input type="text" name="titular" id="titular" class="form-control" required>
						<small class="text-muted">Ingrese el nombre como aparece en la tarjeta</small>
					</div>
					<div class="col-md-6 mb-3">
						<label for="nroTarjeta">N�mero de la Tarjeta</label>
						<input type="text" name="nroTarjeta" id="nroTarjeta" class="form-control" required>
						<small class="text-muted">Ingrese los 16 d�gitos de la tarjeta</small>
					</div>
				</div>

				<div class="row">
					<div class="col-md-3 mb-3"></div>
					<div class="col-md-3 mb-3">
						<label for="fechaVto">Fecha de Vencimiento</label>
						<input type="text" name="fechaVto" id="fechaVto" class="form-control" required>
						<small class="text-muted">Ingrese los 4 dígitos sin espacios</small>
					</div>
					<div class="col-md-3 mb-3">
						<label for="codigoSeg">Código de Seguridad</label>
						<input type="text" name="codigoSeg" id="codigoSeg" class="form-control" required>
						<small class="text-muted">Ingrese los 3 dígitos</small>
					</div>
				</div>


				<div class="row">
					<button type="submit" class="btn btn-primary">Ingresar solicitud</button>
				</div>

			</form>


		</div>
	</div>
	
	
	


	<!-- Bootstrap JavaScript Libraries -->
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
</body>

</html>