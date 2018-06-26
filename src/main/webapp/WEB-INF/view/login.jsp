<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Login Page</title>

<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet">

</head>

<body>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>

	<div class="container" style="position: relative;">

		<div class="row">
			<div class="col-sm-12">


			<div class="col-md-12">




				<div style="margin-top: 10px;"
					class="mainbox col-md-3 col-md-3 col-md-offset-2">
					

						<form:form
							action="${pageContext.request.contextPath}/authenticateTheUser"
							method="POST">

							<!-- Check for error -->

							<c:if test="${param.error != null}">
								<div class="alert alert-danger col-md-offset-1 col-xs-10">
									<i>Invalid username/password. </i>
								</div>

							</c:if>

							<c:if test="${param.logout != null }">
							<div class="alert alert-success col-md-offset-1 col-xs-10">
									<i>You have been logged out</i>
								</div>
							</c:if>
							<div class="form-group">
								
								
								
								Username:	<input type="text" name="username"
										class="form-control" />
								
							</div>
							<div class="form-group">
								
									Password: <input type="password" name="password"
										class="form-control" />
								
							</div>

							<input type="submit" value="Sign In" class="btn btn-outline-primary btn-sm" />

						</form:form>
					</div>
				</div>
			</div>
			</div>
		</div>
</body>

</html>