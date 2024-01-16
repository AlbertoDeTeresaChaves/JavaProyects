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
	int socioID=Integer.valueOf(request.getParameter("socioID"));
	String nombre= request.getParameter("nombre");
	int estatura = Integer.valueOf(request.getParameter("estatura"));
	int edad = Integer.valueOf(request.getParameter("edad"));
	String localidad = request.getParameter("localidad");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto","root","root");
	Statement s = conexion.createStatement();
	
	String consultaNumSocio = "SELECT count(*) ne FROM socio WHERE socioID= "+ Integer.valueOf(request.getParameter("socioID"));
	
	ResultSet numeroDeSocios = s.executeQuery(consultaNumSocio);
	int n = -1;
	
	while(numeroDeSocios.next()){
		n = numeroDeSocios.getInt(1);
	}
	if(n!=0){
		out.println("Lo siento, no se pudo dar de alta, ya existe un socio con el numero " + request.getParameter("socioID") + ".");
	}else{
		String insercion = "INSERT INTO socio VALUES (" +socioID+",'" + nombre+"',"+estatura+"," + edad+",'"+localidad +"')";
		out.println(insercion);
		s.execute(insercion);	
		out.println("Socio dado de alta correctamente.");
	}
	s.close();
	%>
	<br>
		<a href="index.jsp" class="btn btn-primary"> <span class="glyphicon glyphicon-pencil"></span>Pagina Principal</a>
</body>
</html>