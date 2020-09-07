<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Verify Employee</title>
</head>
<body>

	<%
		//JDBC driver name and database URL
		//STEP 2: Register JDBC driver
	%>
	
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/emp" user="root" password="mysql" />

	<%
		//Getting Request parameters
	%>
	
	<c:set var="empid" scope="session" value="${param.empid}" />

	<%
		//STEP 3: Open a connection
		//STEP 4: Execute a query
	%>
	
	<sql:query dataSource="${snapshot}" var="result">
		select count(*) as kount from Employees
 		where id = ?
 	<sql:param value="${empid}" />
	</sql:query>
	
	<%
		//STEP 5: Extract data from result set
	%>
	
	<c:forEach items="${result.rows}" var="r">
		<c:choose>
			<c:when test="${r.kount > 0}">
				<c:out value="Employee of Id ${empid} exists" />
			</c:when>
			<c:otherwise>
				<c:out value="Employee of Id ${empid} does not exists" />
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<br>
	<a href="selectEmpID.jsp">Back</a>
	<br>
	<a href="Employee.jsp">Employee</a>
	
</body>
</html>
