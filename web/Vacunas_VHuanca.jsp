<%-- 
    Document   : Vacunas_VHuanca
    Created on : 13-abr-2021, 19:05:19
    Author     : Vlxdy Hishikawa
--%>

<%@page import="com.Vlxdy.modelo.Datos_Vacunas"%>
<%@page import="com.Vlxdy.modelo.GestorVacunas"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    if (session.getAttribute("misDatos") == null){
        GestorVacunas objeto1 = new GestorVacunas(); 
        objeto1.insertarVacunas(new Datos_Vacunas(1, "Brunito Diaz",25.0,1.40,"SI"));
        objeto1.insertarVacunas(new Datos_Vacunas(2, "Juancito Pinto",30.0,1.52,"NO"));
        session.setAttribute("misDatos", objeto1);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="author" content="VLADIMIR HUANCA">
        <meta name="viewport" content="with=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="Logo.png">
        <title> Vacunas_VHuanca </title>
    </head>
    <style>
        body {
  		background-image: linear-gradient(
     		rgba(0, 0, 0, 0.6),
     		rgba(0, 0, 0, 0.6)
   			), url("Fondo.png");
  			background-repeat: no-repeat;
 			background-attachment: fixed;
  			background-size: 100% 100%;
  			padding: 20px;
  			background-color:#dbffcc;
            }
        .i {
         background-color: yellow;
        }
        #heading { color: #fff; }
	a,h1,h2,h4,li{
		color: white;
                }
        b{
	   color: yellow;
        }
        table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        }
        
        th {
          border: 1px solid white;
          background-color:black;
          color: white;
          text-align: left;
          padding: 8px;
        }

        td {
          border: 1px solid black;
          text-align: left;
          padding: 8px;
        }

        tr:nth-child(odd) {
          background-color: #dddddd;
        }
        tr:nth-child(even) {
          background-color: white;
          color:black;
        }
    </style>
    <body>
        
        <table class="i" border="1" align="center">
            <tr>
                <td class="i" > <strong>PRIMER PARCIAL TEM-742</strong> <br><br>
                    <strong> Tecnologías Emergentes II </strong><br>
                    <strong> Nombre: HUANCA TICONA VLADIMIR </strong> <br>
                    <strong> Carnet: 9248837 </strong>
                </td>     
            </tr>
        </table>
        
        <h1 align="center"> REGISTROS DE VACUNAS </h1>
        <a href="Controlador_Vacunas?op=nuevo" > NUEVO </a>
        <br><br>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>NOMBRE</th>
                <th>PESO</th>
                <th>TALLA</th>
                <th>VACUNA</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="item" items="${sessionScope.misDatos.getLista()}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.nombre}</td>
                    <td>${item.peso}</td>
                    <td>${item.talla}</td>
                    <td>${item.vacuna}</td>
                    <td><a style="color:blue;" href="Controlador_Vacunas?op=modificar&id=${item.id}">MODIFICAR</a></td>
                    <td><a style="color:red;" href="Controlador_Vacunas?op=eliminar&id=${item.id}">ELIMINAR</a></td>
                </tr>
            </c:forEach>
        </table>
    <footer>
        <p><br><br>
            <h3 id="heading" align="center">DEVELOPED &#x1F497; by <a style="color:yellow;" ><strong>VLADIMIR HUANCA</strong></a></h3>
        </p>
    </footer>
    </body>
</html>
