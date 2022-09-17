<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de horarios</title>
    </head>
    <body>
        <h1>Listado de horarios</h1>
    <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/chrono"
        ,"root", "");
        Statement s = conexion.createStatement();
        request.setCharacterEncoding("UTF-8");
        String insercion = "INSERT INTO rango (id_curso, hora_inicio, hora_fin, dia) VALUES ("
            + Integer.valueOf(request.getParameter("curso"))
            + ", '" + request.getParameter("hora_inicio")
            + "', '" + request.getParameter("hora_fin")
            + "', '" + request.getParameter("dia")
            + "');";
        s.execute(insercion);
        conexion.close();
    %>
    Alumno dado de alta.

    </body>
</html>