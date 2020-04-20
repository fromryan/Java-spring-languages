<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>Index</title>
<style>
	btn-inline {
		display: inline-block;
	}
</style>
</head>
<body>

<div class="jumbotron">
	<h1 class="display-4">Programming Languages</h1>
	<hr class="my-4">
	<p class="lead">Add, delete, and edit programming languages of your choice.</p>
	
	<form:form id="create-form" action="/languages/create" method="post" modelAttribute="language">
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
		<input class="btn btn-info" type="submit" value="Create" />
	</form:form>			
</div>

<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Name</th>
      <th scope="col">Creator</th>
      <th scope="col">Version</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
	<c:forEach items="${languages}" var="language">
	    <tr>
 	      <th scope="row">${language.id}</th>
	      <td><a href="/languages/${language.id}">${language.name}</a></td>
	      <td>${language.creator}</td>
	      <td>${language.version}</td>
	      <td>
		  	<a id="btn-inline" href="/languages/edit/${language.id}" class="btn btn-info" role="button">Edit</a>
		    <form id="btn-inline" action="/languages/${language.id}/delete" method="post">
    		  <input type="hidden" name="_method" value="delete">
   			  <input id="btn-inline" type="submit" value="Delete" class="btn btn-secondary">
			</form>
	      </td>
	    </tr>
	</c:forEach>
  </tbody>
</table>



</body>
</html>