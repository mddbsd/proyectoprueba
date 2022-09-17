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
        <title>consultaclases</title>
    </head>
    <body>
        <h1>consultas</h1>
    <% 
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/chrono"
        ,"root", "");
        Statement s = conexion.createStatement();
        request.setCharacterEncoding("UTF-8");
        ResultSet listado = s.executeQuery ("SELECT rango.dia AS dia, "
          + "                                       curso.nombre_curso AS nombre_curso, "
          + "                                       rango.hora_inicio AS hora_inicio, "
          + "                                       rango.hora_fin AS hora_fin "
          + "                                       FROM rango JOIN curso "
          + "                                       ON rango.id_curso= curso.id_curso "
          + "                                       AND curso.nombre_curso= '" + request.getParameter("curso") + "'");
        
      
        while (listado.next()){
            
            out.println("curso: " + listado.getString("nombre_curso") + "</br>");
            out.println("dia: " + listado.getString("dia") + "</br>");
            out.println("hora de inicio: " + listado.getString("hora_inicio") + "</br>");
            out.println("hora de fin: " + listado.getString("hora_fin") + "</br>");
        }
        conexion.close();
    %>
    </body>
</html>