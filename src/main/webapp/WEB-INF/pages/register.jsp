	<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title><spring:message code="register.form.title"></spring:message></title>
</head>
<body>
	<H1>
		<spring:message code="register.form.title"></spring:message>
	</H1>
	
		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>
	<form:form modelAttribute="user" method="POST" enctype="utf8">
		<br>
		<tr>
			<td><label><spring:message
						code="register.user.firstName"></spring:message> </label></td>
			<td><form:input path="firstName" value="" /></td>
			<form:errors path="firstName" element="div" />
		</tr>
		<tr>
			<td><label><spring:message code="register.user.lastName"></spring:message>
			</label></td>
			<td><form:input path="lastName" value="" /></td>
			<form:errors path="lastName" element="div" />
		</tr>

		<tr>
			<td><label><spring:message code="register.user.userName"></spring:message>
			</label></td>
			<td><form:input path="userName" value="" /></td>
			<form:errors path="userName" element="div" />
		</tr>
		<tr>
			<td><label><spring:message code="register.user.email"></spring:message>
			</label></td>
			<td><form:input path="email" value="" /></td>
			<form:errors path="email" element="div" />
		</tr>
		<tr>
			<td><label><spring:message code="register.user.password"></spring:message>
			</label></td>
			<td><form:input path="password" value="" type="password" /></td>
			<form:errors path="password" element="div" />
		</tr>
		<tr>
			<td><label><spring:message
						code="register.user.confirmPass"></spring:message> </label></td>
			<td><form:input path="matchingPassword" value="" type="password" /></td>
			<form:errors element="div" />
		</tr>
		<button type="submit">
			<spring:message code="register.form.submit"></spring:message>
		</button>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form:form>
	<br>
	<a href="<c:url value="login" />">login </a>
</body>
</html>