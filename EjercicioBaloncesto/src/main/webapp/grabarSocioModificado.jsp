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
</head>
<body>
	<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto","root","root");
	Statement s = conexion.createStatement();
	String sentencia = String.format("UPDATE socio SET NOMBRE='%s',ESTATURA=%s,EDAD=%s,LOCALIDAD='%s' WHERE SOCIOID=%s",
	request.getParameter("nombre"),request.getParameter("estatura"),request.getParameter("edad"),request.getParameter("localidad"),request.getParameter("socioID"));
	s.execute(sentencia);
	s.close();
	%>
		<script>document.location="index.jsp"</script>
</body>
</html>