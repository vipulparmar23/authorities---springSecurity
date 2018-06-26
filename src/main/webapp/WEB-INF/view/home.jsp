<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "security" uri = "http://www.springframework.org/security/tags" %>

<html>
<head>
	<title>Company Home Page</title>
	
	<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet">
	
</head>

<body>
<div class="container">
			
	<h2>Company Home Page</h2>
	<hr/>
	
	
	<h5>Welcome to the Company Home Page!</h5>
	
	<hr>
	User: <security:authentication property="principal.username"/> <br>
	Role(s): <security:authentication property="principal.authorities"/>
	
		<!--  Add a link to point to /leaders.. this is for managers -->
	
	<security:authorize access="hasRole('MANAGER')">
	<hr>
	<p>
		<a href = "${pageContext.request.contextPath }/leaders">Leadership Meeting </a>
		(For Managers only)
	</p>
	
	</security:authorize>
	
	<security:authorize access="hasRole('ADMIN')">
	
	<p>
		<a href ="${pageContext.request.contextPath}/systems">System Upgrade</a> (For Admins only)
	
	</p>
	
	</security:authorize>
	<hr>
	<br>
	<!--  Adding a logout button -->
	
	<form:form action = "${pageContext.request.contextPath }/logout" method= "POST">
	
	<input type = "submit" value = "Log out" class = "btn btn-outline-primary btn-sm"/>
	
	
	</form:form>
 	</div>
</body>
</html>