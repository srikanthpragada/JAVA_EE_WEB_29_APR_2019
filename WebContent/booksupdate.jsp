<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource url="jdbc:oracle:thin:@localhost:1521:XE"
	var="oracle" driver="oracle.jdbc.driver.OracleDriver" user="hr"
	password="hr" />

<sql:update dataSource="${oracle}" var="count">
    update books set title = ?, author = ?, category = ?, nopages = ?
    where id = ?
    <sql:param value="${param.title}" />
    <sql:param value="${param.author}" />
    <sql:param value="${param.category}" />
    <sql:param value="${param.nopages}" />
	<sql:param value="${param.id}" />
</sql:update>

<c:redirect url="bookshome.jsp"></c:redirect>


