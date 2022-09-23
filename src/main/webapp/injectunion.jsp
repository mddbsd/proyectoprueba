<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="funciones.ComparaTiempos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        ////////CONEXION////////////////////////////////////////////////////////////////////////
        // Primer parametro:
        // localhost:3306 es el servidor mysql por defecto /chrono es la base de datos a la que
        // se conecta 
        // Segundo y tercer parametro: usuario y contraseña del usuario de base de datos
        // Asegurarse de que tenga los permisos correspondientes
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/chrono"
        ,"root", "");
        /////QUERIES////////////////////////////////////////////////////////////////////////////
        Statement b = conexion.createStatement();
        ResultSet inject= b.executeQuery("SELECT apyn, telefono FROM alumnos where id_alumno=" + request.getParameter("id"));    
        request.setCharacterEncoding("UTF-8");
        while(inject.next()){
            out.print(" " + inject.getString("telefono") + "</br>");
            out.print(" " + inject.getString("apyn") + "</br>");
        }
        
        //INJECCION UNION
        // 2 union select usuario, contrasena from usuarios
        %>
    </body>
</html>
