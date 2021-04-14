<%-- 
    Document   : Editar
    Created on : 13-abr-2021, 19:05:33
    Author     : Vlxdy Hishikawa
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        #heading { color: #fff; }
        a,h1,h2,h4,li{
		color: white;
                }
        form{
		width: 480px;
		padding: 16px;
		border-radius: 0px;
		margin: auto;
		background-color: #ccf;
	}
	form input[type="number"]{
		width: 200px;
		padding: 3px 10px;
		border:1px solid #f6f6f6;
		border-radius: 3px;
		background-color:#9f9;
		margin:8px 0;
		display: inline-block;
	}
        form input[type="text"]{
		width: 200px;
		padding: 3px 10px;
		border:1px solid #f6f6f6;
		border-radius: 3px;
		background-color:#9f9;
		margin:8px 0;
		display: inline-block;
	}
	form input[type="submit"]{
		width: 100%;
		padding: 8px 16px;
		margin-top: 32px;
		border:1px solid #1e3300;
		border-radius: 5px;
		display: block;
		color: #fff;
		background-color:#1e3300;
	}
	form input[type="submit"]:hover{
            
		cursor:pointer;
	}
        SELECT{ 
                width: 200px;
		padding: 3px 10px;
		border:1px solid #f6f6f6;
		border-radius: 3px;
		background-color:  #f6f6f6;
		margin:8px 0;
		display: inline-block;
            }
    </style>
    <body>
        <h1>
            <c:if test="${requestScope.op == 'nuevo'}" var="res" scope="request">
                <h1 align="center">REGISTRO DE VACUNACION </h1>
            </c:if>
             <c:if test="${requestScope.op == 'modificar'}" var="res" scope="request">
                 <h1 align="center">MODIFICACION DEL REGISTRO DE VACUNACION DE <jsp:getProperty name="ListVacunados" property="nombre" /></h1>
            </c:if>  
        <jsp:useBean id="ListVacunados" scope="request" class="com.Vlxdy.modelo.Datos_Vacunas" />
        
        <form action="Controlador_Vacunas" method="post">
            <h3 align="center">
                <c:if test="${requestScope.op == 'nuevo'}" var="res" scope="request">
                INGRESE LOS DATOS DEL VACUNADO
                </c:if>
                <c:if test="${requestScope.op == 'modificar'}" var="res" scope="request">
                MODIFIQUE LOS DATOS DEL VACUNADO 
                </c:if>             
            </h3>
            <table>
                <tr>
                    <td>ID: </td>
                    <td><input type="text" name="id" readonly value="<jsp:getProperty name="ListVacunados" property="id" />"></td>
                </tr>
                <tr>
                    <td>NOMBRE: </td>
                    <td><input type="text" name="nombre" value="<jsp:getProperty name="ListVacunados" property="nombre" />" required/></td>
                </tr>
                <tr>
                    <td>PESO: </td>
                    <td><input type="number" name="peso" step="any" max="500" min="0.1" value="<jsp:getProperty name="ListVacunados" property="peso" />" required></td>
                </tr>
                <tr>
                    <td>TALLA: </td>
                    <td><input type="number" name="talla" step="any" max="3.0" min="0.1" value="<jsp:getProperty name="ListVacunados" property="talla" />" required></td>
                </tr>
                <tr>
                    <td>VACUNAS: </td>
                    <td>
                        <select name="vacuna">
                            <option value=""         
                                    <c:if test="${ListVacunados.vacuna == ''}" var="res" scope="request">
                                        selected
                                    </c:if>
                                    >Seleccione una opcion</option>
                            <option value="SI"         
                                    <c:if test="${ListVacunados.vacuna == 'SI'}" var="res" scope="request">
                                        selected
                                    </c:if>
                                    >SI</option>
                            <option value="NO" 
                                    <c:if test="${ListVacunados.vacuna == 'NO'}" var="res" scope="request">
                                        selected
                                    </c:if>
                                    >NO</option>

                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="hidden" name="opg" value="${requestScope.op}" />
                        <input type="hidden" name="op" value="grabar" />
                    </td>    
                    <td><input type="submit" value="Enviar" /></td>
                </tr>
            </table>
        </form>
    <footer>
        <p><br><br>
            <h3 id="heading" align="center">DEVELOPED &#x1F497; by <a style="color:yellow;" ><strong>VLADIMIR HUANCA</strong></a></h3>
        </p>
    </footer>
    </body>
</html>