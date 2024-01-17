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
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_scott","root","root");
                
                Statement s = conexion.createStatement();
                ResultSet listado = s.executeQuery("Select * from emp");
                
                Statement z = conexion.createStatement();         
                ResultSet jefes = z.executeQuery ("SELECT ENAME,EMPNO FROM EMP ORDER BY 1");
                
                Statement w = conexion.createStatement();          
                ResultSet departamentos = z.executeQuery ("SELECT DNAME,DEPTNO FROM DEPT");
            %>
            <table class="table table-striped">
                <tr><th>EMPNO</th><th>ENAME</th><th>JOB</th><th>MGR</th><th>SAL</th><th>COMM</th><th>DEPTNO</th><th>HIREDATE</th></tr>  
                <form action="get">
                    <tr><td><input type="text" name="EMPNO"></td>
                        <td><input type="text" name="ENAME"></td>
                        <td><input type="text" name="JOB"></td>
                    <td><select name="mgr">
                        <% 
                        while(jefes.next()){
                            %>
                            <option  value="<%=jefes.getString("EMPNO") %>"> <%=jefes.getString("ENAME") %></option>
                            <%
                        }
                        %>
                    </td></select>
                        <td><input type="text" name="SAL"></td>
                        <td><input type="text" name="COMM"></td>
                    <td><select name="DEPTNO">
                        <%
                        while(departamentos.next()){
                            %>
                            <option value="<%=departamentos.getString("DEPTNO") %>"> <%=departamentos.getString("ENAME")%></option>
                            <%
                        }
                        %>
                    </td></select>
                        <td><input type="text" name="HIREDATE"></td>
                    
                </form>
                    </tr>
                
            </table>
        </div>
    </div>
</body>
</html>