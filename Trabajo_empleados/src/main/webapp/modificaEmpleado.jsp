<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modificar Empleado - Alberto</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script> 
</head>
<body>
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
    <div class="container">
        <div class="panel panel-primary">
            <div class="panel-heading text-center">
                <h2>Modificar</h2>
            </div>
            <form action="grabarEmpleadoModificado.jsp">
            <div class="form-group">
                EMPNO: <input type="text" size="10" name="empno" value="<%=request.getParameter("empno") %>">
                ENAME: <input type="text" size="10" name="ename" value="<%=request.getParameter("ename") %>">
            </div>
            <div class="form-group">
                JOB: <input type="text" size="20" name="job" value="<%=request.getParameter("job") %>">
            </div>
            <div class="form-group">
                MGR: <select name="mgr">
                        <% 
                        while(jefes.next()){
                            %>
                            <option value="<%=jefes.getString("EMPNO") %>"> <%=jefes.getString("ENAME") %></option>
                            <%
                        }
                        %>
                   </select>
            </div>
            <div class="form-group">
                SAL: <input type="text" size="10" name="sal" value="<%=request.getParameter("sal") %>">
                COMM: <input type="text" size="10" name="comm" value="<%=request.getParameter("comm") %>">
            </div>
            <div class="form-group">
                DEPTNO: <select name="deptno">
                        <%
                        while(departamentos.next()){
                            %>
                            <option value="<%=departamentos.getString("DEPTNO") %>"> <%=departamentos.getString("DNAME")%></option>
                            <%
                        }
                        %>
                    </select>
            </div>
            <div class="form-group">
                HIREDATE: <input type="text" size="8" name="hiredate" value="<%=request.getParameter("hiredate") %>">
            </div>             
            <hr>
                &nbsp;&nbsp;<a href="index.jsp" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Cancelar</a>
                <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span>Aceptar</button><br><br>
            </form>
			</div>
    </div>
</body>
