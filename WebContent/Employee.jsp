<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%
	//JDBC driver name and database URL
	//STEP 2: Register JDBC driver
%>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/emp" user="root" password="mysql" />
	
<%
	//STEP 3: Open a connection
	//STEP 4: Execute a query
%>

<sql:query dataSource="${snapshot}" var="result">
	SELECT * from Employees;
</sql:query>

<%
	//STEP 5: Extract data from result set
%>

<table width=80%>
	<tr>
		<th>ID</th>
		<th>First</th>
		<th>Last</th>
		<th>Age</th>
	</tr>
	<c:forEach var="row" items="${result.rows}">
		<tr align=center>
			<td><c:out value="${row.id}" /></td>
			<td><c:out value="${row.first}" /></td>
			<td><c:out value="${row.last}" /></td>
			<td><c:out value="${row.age}" /></td>
		</tr>
	</c:forEach>
</table>
</body>
</html>