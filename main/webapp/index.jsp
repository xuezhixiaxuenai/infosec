<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎参与信息系统安全课程</title>
</head>
<body>
<h1>信息系统安全-课程设计要求</h1>
<br>
<sec:authorize access="not isAuthenticated()">
<a href="<c:url value="/login" />">账号密码登陆</a>&nbsp;&nbsp;&nbsp;
<a href="<c:url value="/forelogin"/>">用户证书登陆</a>
</sec:authorize>

<sec:authentication var="user" property="principal" />

<sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
<a href="<c:url value="/users" />">用户列表</a>&nbsp;&nbsp;&nbsp;
</sec:authorize>

<sec:authorize access="hasRole('ROLE_USER') and isAuthenticated()">
    <a href="<c:url value="/user" />">用户信息</a>&nbsp;&nbsp;&nbsp;
</sec:authorize>

<sec:authorize access="isAuthenticated()">
<%--<a href="<c:url value="/user/1" />">用户信息</a>&nbsp;&nbsp;&nbsp;--%>
<a href="<c:url value="/logout" />">退出</a>
</sec:authorize>

</body>
</html>