<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado Socios</title>
    </head>
    <body>
        <h1>Listado de alumnos</h1>
    <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/prueba1"
        ,"root", "");
        
        Statement s = conexion.createStatement();
        ResultSet listado = s.executeQuery ("SELECT * FROM alumnos");
        
        while (listado.next()) {
            out.println(listado.getString("matricula") + " " + listado.getString("apyn") + "<br>");
        }
        conexion.close();
    %>
    </body>
</html>