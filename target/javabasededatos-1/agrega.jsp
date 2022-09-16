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
        request.setCharacterEncoding("UTF-8");
        String insercion = "INSERT INTO alumnos (matricula, apyn, curso, dni) VALUES ("
            + Integer.valueOf(request.getParameter("matricula"))
            + ", '" + request.getParameter("nombre")
            + "', '" + request.getParameter("curso")
            + "', " + Integer.valueOf(request.getParameter("dni"))
            + ")";
        s.execute(insercion);
        conexion.close();
    %>
    Alumno dado de alta.

    </body>
</html>