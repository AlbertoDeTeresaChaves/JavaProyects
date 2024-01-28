<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eliminar Empleado - Alberto</title>
</head>
<body>
	<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection conexion = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bd_scott","root","1234");
	Statement s = conexion.createStatement();
	
	s.execute("DELETE FROM emp WHERE EMPNO=" + Integer.valueOf(request.getParameter("empno")));
	s.close();
	%>
	<script>document.location="index.jsp"</script>
</body>
</html>