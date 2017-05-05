<%-- 
    Document   : listaAlumno
    Created on : 02-may-2017, 23:16:50
    Author     : Mario
--%>

<%@page import="java.io.EOFException"%>
<%@page import="Almacen.Producto"%>
<%@page import="java.io.*"%>
<%@page import="Almacen.Fichero"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Producto</title>
    </head>
    <body bgcolor="lime">
        <%@include file="html/nav.html" %>
        <h1 style="color:blue">Lista de productos:</h1>
        <table>
            <tr>
                <th style="color:red">Id</th>
                <th style="color:red">Nombre</th>
                <th style="color:red">Descripción</th>
                <th style="color:red">Precio</th>
                <th style="color:red">Fecha Entrada</th>
            </tr>
        <%
            ObjectInputStream ois;
            String respuesta="";
            
           
                Fichero f = new Fichero("leroy.bin","rb");
                Producto aux = (Producto) f.leerObjeto();
                while(aux!=null){
                    
                    respuesta+="<tr>\n"
                            + "<td>"+aux.getId()+"</td>\n"
                            + "<td>"+aux.getNombre()+"</td>\n"
                             + "<td>"+aux.getDescripcion()+"</td>\n"
                             + "<td>"+aux.getPrecio()+"</td>\n"
                             + "<td>"+aux.getFechaEntrada()+"</td>\n"
                            + "</tr>\n";
                    //respuesta+=aux.toString();
                   
                    
                    aux = (Producto) f.leerObjeto();
                }
            
            f.close();
        %>
        <%=respuesta%>
       </table>
        
    </body>
</html>

