<%-- 
    Document   : insertarProducto
    Created on : 04-may-2017, 12:23:57
    Author     : Alumno IG
--%>

<%@page import="Almacen.Producto"%>
<%@page import="Almacen.Fichero"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insertar Producto</title>
    </head>
    <%
            int id;
            String nombre=request.getParameter("nombre");
            String descripcion=request.getParameter("descripcion");
            double precio;
            String fechaEntrada = request.getParameter("fechaEntrada");
        /*  LocalDate fechaEntrada = LocalDate.of(request.getParameter("fechaEntrada")(year, month, dayOfMonth)); */
            String respuesta;
            
            
            try{
                Fichero f = new Fichero("leroy.bin","ab");
                   
                if (request.getParameter("id")==null 
                        || nombre==null 
                        || descripcion==null
                        || request.getParameter("precio")==null
                        || request.getParameter("fechaEntrada")==null                 
                        )
                {
                    respuesta="Alguno de los campos quedó sin rellenar";
                }
                else{
                    precio=Double.parseDouble(request.getParameter("precio"));
                    id = Integer.parseUnsignedInt(request.getParameter("id"));
                    f.escribirObjeto(new Producto(id,nombre,descripcion,precio,fechaEntrada));
                    respuesta="Se insertó con éxito";
                    
                }
                f.close();
            }catch(NumberFormatException nfe){
                respuesta="Error en los números";
            }
            
            
        %>
    <body bgcolor="lime">
        <%@include file="html/nav.html" %>
        <h1 style="color:blue">Tienda:</h1>
        <h2 style="color:blue">Insertar Producto:</h2>
        <form action="insertarProducto.jsp" method="POST">
            Id:<input type="number" name="id"><br>
            Nombre:<input type="text" name="nombre"><br>
            Descripción:<input type="text" name="descripcion"><br>
            Precio:<input type="number" name="precio"><br>
            Fecha:<input type="text" name="fechaEntrada"><br><br>
            <input style="background-color:yellow" type="submit" value="Enviar">
            <input style="background-color:yellow" type="reset" value="Limpiar">
        </form>
        <p><%=respuesta%></p>
              
    </body>
</html>
