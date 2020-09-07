<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Validate.jsp</title>
		<style>
			p {
				text-align: center;
				font-weight: bold;
				color: red;
			}
		</style>
	</head>

	<body>

	<%	//JDBC driver name and database URL
		//STEP 2: Register JDBC driver	%>
	
	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/bookstore" user="root" password="mysql" />
	
	<% //Getting Request parameters	%>
	
	<c:set var="uname" scope="session" value="${param.uname}" />
	<c:set var="psw" scope="session" value="${param.psw}" />
	
	<%	//STEP 3: Open a connection
		//STEP 4: Execute a query %>
	
	<sql:query dataSource="${snapshot}" var="result">
		select count(*) as kount from users
 		where username = ? and pass = ?;
 	<sql:param value="${uname}"/>
 	<sql:param value="${psw}"/>
	</sql:query>
	
		<% //STEP 5: Extract data from result set %>
	
	<c:forEach items="${result.rows}" var="r">
		<c:choose>
			<c:when test="${r.kount > 0}">
				<p> <c:out value="Welcome ${uname}!" /> </p>
			</c:when>
			<c:otherwise>
				<c:out value="Sorry, we cannot find ${uname}, please check your username." />
			</c:otherwise>
		</c:choose>
	</c:forEach>	
	
	</body>
</html>