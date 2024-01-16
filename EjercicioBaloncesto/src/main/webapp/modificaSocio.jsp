<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script> 
</head>
<body>
    <%request.setCharacterEncoding("UTF-8");%>
    <div class="container">
        <div class="panel panel-primary">
            <div class="panel-heading text-center">
                <h2>Modificar</h2>
            </div>
            <form action="grabarSocioModificado.jsp">
                <div class="form-group">
                <input type="hidden" name="socioID" value="<%=request.getParameter("nombre") %>">
                Nombre: <input type="text" size="30" name="nombre" value="<%=request.getParameter("nombre") %>">
            </div>
                <div class="form-group">
                Estatura: <input type="text" size="5" name="estatura" value="<%=request.getParameter("estatura") %>">
                Edad: <input type="text" size="5" name="edad" value="<%=request.getParameter("edad") %>">
            </div>
            <div class="form-group">
                Localidad: <input type="text" size="20" name="localidad" value="<%=request.getParameter("localidad") %>">
            </div>
            <hr>
                &nbsp;&nbsp;<a href="index.jsp" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Cancelar</a>
                <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span>Aceptar</button><br><br>
            </form>
			</div>
    </div>
</body>
</html>