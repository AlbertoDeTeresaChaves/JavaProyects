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
    Connection conexion = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bd_scott","root","1234");
	Statement s = conexion.createStatement();
	String actualizacion =  String.format("UPDATE emp SET EMPNO='%s', ENAME ='%s', JOB='%s', MGR='%s', SAL='%s', COMM='%s', DEPTNO='%s', HIREDATE = '%s' WHERE EMPNO=%s",
			 
	request.getParameter("empno"),request.getParameter("ename"),request.getParameter("job"),
	request.getParameter("mgr"),request.getParameter("sal"), request.getParameter("comm"), request.getParameter("deptno"), request.getParameter("hiredate"), request.getParameter("empno"));
			 
	s.execute(actualizacion);
	out.println("Socio actualizado correctamente");
	conexion.close();
	%>
		<script>document.location="index.jsp"</script>

</body>
</html>