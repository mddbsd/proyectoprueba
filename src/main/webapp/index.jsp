<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado Alumnos</title>
    </head>
    <body>
        <h1>Listado de alumnos</h1>
    <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/prueba1"
        ,"root", "");
        Statement a = conexion.createStatement();
        Statement s = conexion.createStatement();
        ResultSet listado = s.executeQuery ("SELECT * FROM alumnos");
        ResultSet listadoh = a.executeQuery ("SELECT * FROM horarios");
        while (listado.next()) {
            out.println(listado.getString("matricula") + " " + listado.getString("apyn") + " " + listado.getString("dni") + "<br>");
        }
        while (listadoh.next()) {
            out.println(listadoh.getString("hora_inicio") + listadoh.getString("hora_salida") + "<br>");
    }
        conexion.close();
    %>
    </body>
</html>
