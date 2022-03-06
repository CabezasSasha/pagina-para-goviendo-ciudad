
<%@page import="model.Localidad"%>
<%@page import="dao.LocalidadDAOEC"%>
<%@page import="model.Pedido"%>
<%@page import="java.util.List"%>
<%@page import="dao.PedidoDAOEC"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!doctype html>
<html lang="en">

<head>
    <title>Listado de Pedidos</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS v5.0.2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>

<body class="text-center bg-light">
    <div class="container">
        <div class="py-4">
            <img class="mb-4 mx-auto" src="../images/logo.jpg" alt="Logo de Codo Codo" width="72px" height="72px">
            <h4>Pedidos</h4>
            <p class="lead">Listado de Pedidos Pendientes</p>
        </div>
        
        <table class="table table-striped table-sm table-bordered table-hover">
            <thead class="thead-default">
                <tr>
                    <th>#ID</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Usuario</th>
                    <th>E-mail</th>
                    <th>Direcci�n</th>
                    <th>Localidad</th>
                    <th>Provincia</th>
                    <th>C�digo Postal</th>
                    <th>Modificar</th>
                </tr>
                </thead>
                <tbody>
                    <% 
                    PedidoDAOEC pedidoDAOEC = new PedidoDAOEC();
                    List<Pedido> listPedidos = pedidoDAOEC.listarPedidos();
                    
                    LocalidadDAOEC localidadDAOEC = new LocalidadDAOEC();                    
                    for(int i=0; i < listPedidos.size(); i++) {
                    	Integer idLocalidad = listPedidos.get(i).getLocalidad();
                    	Localidad localidad = localidadDAOEC.buscarXID(idLocalidad);
                    	
                    	out.println("<tr>");
                    	out.println("<td>" + listPedidos.get(i).getIdPedido() + "</td>");
                    	out.println("<td>" + listPedidos.get(i).getNombre() + "</td>");
                    	out.println("<td>" + listPedidos.get(i).getApellido() + "</td>");
                    	out.println("<td>" + listPedidos.get(i).getUsuario() + "</td>");
                    	out.println("<td>" + listPedidos.get(i).getMail() + "</td>");
                    	out.println("<td>" + listPedidos.get(i).getLugarEntrega() + "</td>");
                    	//out.println("<td>" + listPedidos.get(i).getLocalidad() + "</td>");
                    	out.println("<td>" + localidad.getNombre() + "</td>");
                    	out.println("<td>" + listPedidos.get(i).getProvincia() + "</td>");
                    	out.println("<td>" + listPedidos.get(i).getCodPostal() + "</td>");
                    	out.println("<td><a href='../controller/modificarPedido.php?id=6'>Modificar</a></td>");
                    	out.println("</tr>");
                    }
                    
                    %>

                </tbody>
                
        </table>
        

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