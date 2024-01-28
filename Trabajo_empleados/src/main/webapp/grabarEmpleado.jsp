<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalDate" %>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agregar Empleado - Alberto</title>
</head>
<body>
	<%
	//Agregando las variables
	int empno= Integer.valueOf(request.getParameter("empNo"));
	String ename= request.getParameter("eName");
	String job= request.getParameter("job");
	int mgr= Integer.valueOf(request.getParameter("mgr"));
	double sal = Double.valueOf(request.getParameter("SAL"));
	double comm = Double.valueOf(request.getParameter("COMM"));
	int deptno = Integer.valueOf(request.getParameter("DEPTNO"));
	String fecha = request.getParameter("HIREDATE");
	LocalDate ld;
	
	try{
	if(fecha.isEmpty()){
		ld = LocalDate.now();
		fecha = String.valueOf(ld);
	}else{
		ld = LocalDate.parse(fecha);
		fecha = String.valueOf(ld);
	}
	}catch(Exception e){
		out.print("Error al insertar la fecha");
	}
	//Conexion con la base de datos
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bd_scott","root","1234");
    
	Statement s = conexion.createStatement();
	
	String consultaNumEmpleado = "SELECT count(*) ne FROM emp WHERE EMPNO= "+ Integer.valueOf(request.getParameter("empNo"));
	
	ResultSet numeroDeEmpleados = s.executeQuery(consultaNumEmpleado);
	int n =-1;
	
	while(numeroDeEmpleados.next()){
		n = numeroDeEmpleados.getInt(1);
	}
	if(n!=0){
		out.println("Numero de empleado ya existente " + request.getParameter("empNo"));
	}else{
		String sentencia = "INSERT INTO emp (EMPNO, ENAME, JOB, MGR, SAL, COMM, DEPTNO, HIREDATE) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		try(PreparedStatement ps = conexion.prepareStatement(sentencia)){
			ps.setInt(1,empno);
			ps.setString(2,ename);
			ps.setString(3,job);
			ps.setInt(4,mgr);
			ps.setDouble(5,sal);
			ps.setDouble(6,comm);
			ps.setInt(7,deptno);
			ps.setString(8,fecha);
			
			ps.executeUpdate();
		}
		out.print("Empleado agregado");
	}
	conexion.close();
	%>
</body>
</html>