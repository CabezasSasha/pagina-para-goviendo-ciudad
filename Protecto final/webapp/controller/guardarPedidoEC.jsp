<%@page import="java.math.BigInteger"%>
<%@page import="dao.PedidoDAOEC"%>
<%@page import="model.Pedido"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<%
	String nombre = request.getParameter("nombre");
	String apellido = request.getParameter("apellido");
	String usuario = request.getParameter("usuario");
	String email = request.getParameter("email");
	String direccion = request.getParameter("direccion");
	Integer localidad = Integer.valueOf(request.getParameter("localidad"));
	Integer provincia = Integer.valueOf(request.getParameter("provincia"));
	String codPostal = request.getParameter("codPostal");
	String formaPago = request.getParameter("formaPago");
	String titular = request.getParameter("titular");
	Long nroTarjeta = Long.valueOf(request.getParameter("nroTarjeta"));
	String fechaVto = request.getParameter("fechaVto");
	Integer codigoSeg = Integer.valueOf(request.getParameter("codigoSeg"));
	
	//TODO: cambiar en jsp el select x id localidad y provincia
	Pedido pedido = new Pedido(nombre,apellido,usuario,email,direccion,localidad,provincia,codPostal,formaPago,titular,nroTarjeta,fechaVto,codigoSeg);
	
	PedidoDAOEC pedidoDAO = new PedidoDAOEC();
	Boolean guardoOK = pedidoDAO.guardarPedido(pedido);
	
	if(guardoOK) {
		out.println("El pedido se guardó exitosamente");
	}else {
		out.println("Error en guardar pedido");
	}


%>	

    
</body>
</html>