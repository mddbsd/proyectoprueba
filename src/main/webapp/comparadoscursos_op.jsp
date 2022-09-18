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
        <h1>.inicio de consultas</h1>
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
        ////////QUERIES////////////////////////////////////////////////////////////////////////
        //Creacion de los objetos ResultSet para contener las consultas
        Statement s = conexion.createStatement();
        Statement b = conexion.createStatement();
        request.setCharacterEncoding("UTF-8");
        /*---Consulta con join---*/
        ResultSet listaCurso1 = s.executeQuery("SELECT rango.dia AS dia, "
            + "curso.nombre_curso AS nombre_curso, "
            + "rango.dia AS dia,"
            + "rango.hora_inicio AS hora_inicio, "
            + "rango.hora_fin AS hora_fin "
            + "FROM rango JOIN curso "
            + "ON rango.id_curso= curso.id_curso "
            + "AND curso.nombre_curso= '" + request.getParameter("curso1") + "'");

        ResultSet listaCurso2 = b.executeQuery("SELECT rango.dia AS dia, "
            + "curso.nombre_curso AS nombre_curso, "
            + "rango.dia AS dia,"
            + "rango.hora_inicio AS hora_inicio, "
            + "rango.hora_fin AS hora_fin "
            + "FROM rango JOIN curso "
            + "ON rango.id_curso= curso.id_curso "
            + "AND curso.nombre_curso= '" + request.getParameter("curso2") + "'");
        ///////////////////////////////////////////////////////////////////////////////////
        
        listaCurso1.next(); //inicia el ResultSet con el metodo next para poder utilizar en los <h1>
        out.print("<h1>.Curso1: " + listaCurso1.getString("nombre_curso") + "</h1>");
        do{
           out.println("Dia: " + listaCurso1.getString("dia"));
           out.println("Hora inicio: " + listaCurso1.getString("hora_inicio"));
           out.println("Hora fin" + listaCurso1.getString("hora_fin") + "</br>");
        }while (listaCurso1.next()); //continua invocando al metodo next hasta que no haya mas registros
        
        listaCurso2.next();
        out.print("<h1>.Curso2: " + listaCurso2.getString("nombre_curso") + "</h1>");
        do{
           out.println("Dia: " + listaCurso2.getString("dia"));
           out.println("Hora inicio: " + listaCurso2.getString("hora_inicio"));
           out.println("Hora fin" + listaCurso2.getString("hora_fin") + "</br>");
        }while (listaCurso2.next());
        
        conexion.close();
    %>
    </body>
</html>