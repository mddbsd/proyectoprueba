<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
            String consulta = "SELECT * FROM usuarios where usuario= ? and contrasema= ?";
            Connection conexion = null;
            PreparedStatement consultaPreparada = null;
            boolean exito = false;
            try {
                conexion = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/user", "root", "root");
                consultaPreparada = conexion.prepareStatement(consulta);
                consultaPreparada.setString(1, request.getParameter("susr"));
                consultaPreparada.setString(2, request.getParameter("spwd"));
                ResultSet a = consultaPreparada.executeQuery();
                if (a.next()) {
                    // Si usuario y contrasña coinciden
                    exito = true;
                }
                a.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    consultaPreparada.close();
                    conexion.close();
                } catch (Exception e) {
                }
            }
        if (exito == true){
          out.print("SESION INICIADA");
        } else {
          out.print("ERROR DE USUARIO O CONTRASEÑA");
        }
        %>
    </body>
</html>
