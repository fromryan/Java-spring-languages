<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>Edit Language</title>
</head>
<body>
<div class="jumbotron">
	<h1 class="display-4">Edit Programming Languages</h1>
	<hr class="my-4">
	<p class="lead">Edit your language!</p>

	<form:form id="edit-form" action="/languages/edit/${language.id}/updating" method="post" modelAttribute="language">
		<input type="hidden" name="_method" value="put">
		<p>
			<form:label path="name">Name:</form:label>
			<form:errors path="name" />
			<form:input path="name" />
		</p>
		<p>
			<form:label path="creator">Creator:</form:label>
			<form:errors path="creator" />
			<form:input path="creator" />
		</p>
		<p>
			<form:label path="version">Version:</form:label>
			<form:errors path="version" />
			<form:input path="version" />
		</p>
		<input class="btn btn-info" type="submit" value="Update" />
	</form:form>
</div>
</body>
</html>