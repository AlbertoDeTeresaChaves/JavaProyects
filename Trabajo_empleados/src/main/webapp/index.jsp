<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Departamentos - Alberto</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script> 
</head>
<body>
	<div class="container">
        <div class="panel panel-primary">
            <div class="panel-heading text-center">
                <h2>Empresa SCOTT</h2>
            </div>
            <% 
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bd_scott","root","1234");
                
                Statement s = conexion.createStatement();
                ResultSet listado = s.executeQuery("Select * from EMP");
                
                Statement z = conexion.createStatement();
                ResultSet jefes = z.executeQuery("SELECT ENAME,EMPNO FROM EMP WHERE EMPNO IN(SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL) ORDER BY 1");
                
                Statement w = conexion.createStatement();          
                ResultSet departamentos = w.executeQuery ("SELECT DNAME,DEPTNO FROM DEPT ORDER BY 1");
            %>
            <table class="table table-striped">
                <tr><th>EMPNO</th><th>ENAME</th><th>JOB</th><th>MGR</th><th>SAL</th><th>COMM</th><th>DEPTNO</th><th>HIREDATE</th></tr>  
                <form method="get" action="grabarEmpleado.jsp">
                    <tr><td><input type="text" name="empNo" size="5"></td>
                        <td><input type="text" name="eName" size="5"></td>
                        <td><input type="text" name="job"size="5"></td>
                    <td><select name="mgr">
                        <% 
                        while(jefes.next()){
                            %>
                            <option value="<%=jefes.getString("EMPNO") %>"> <%=jefes.getString("ENAME") %></option>
                            <%
                        }
                        %>
                   </select> </td>
                        <td><input type="text" name="SAL" size="5"></td>
                        <td><input type="text" name="COMM" size="5"></td>
                    <td><select name="DEPTNO">
                        <%
                        while(departamentos.next()){
                            %>
                            <option value="<%=departamentos.getString("DEPTNO") %>"> <%=departamentos.getString("DNAME")%></option>
                            <%
                        }
                        %>
                    </select></td>
                        <td><input type="text" name="HIREDATE" size="5"></td>
						
                    <td><button type="submit" value="Añadir" class="btn btn-primary">
                    <span class="glyphicon glyphicon-plus"></span>Añadir</button>
                    </td>
                    </tr>
                </form>
            <%
            while(listado.next()){
            	out.println("<tr><td>");
                out.println(listado.getString("EMPNO")+"</td>");
                out.println("<td>"+ listado.getString("ENAME")+"</td>");         
                out.println("<td>"+ listado.getString("JOB")+"</td>");
                out.println("<td>"+ listado.getString("MGR")+"</td>");
                out.println("<td>"+ listado.getString("SAL")+"</td>");
                out.println("<td>"+ listado.getString("COMM")+"</td>");
                out.println("<td>"+ listado.getString("EMPNO")+"</td>");
                out.println("<td>"+ listado.getString("HIREDATE")+"</td>");
            }
            %>
           </table>
		</div>
	</div>
 
</body>
</html>