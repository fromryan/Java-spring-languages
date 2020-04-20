<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title><c:out value="${language.name}"/></title>
<style>
	#btn-div {
		margin: 0 auto;
	}
	#btn-div a, form {
		margin: 10px;
		display: inline-block;
	}
</style>
</head>
<body>
	<h1>Language Info.</h3>
	<table class="table table-borderless">
	  <tbody>
	    <tr>
	      <th scope="row">Name:</th>
	      <td><c:out value="${language.name}"/></td>    
	    </tr>
	    <tr>
	      <th scope="row">Creator:</th>
	      <td><c:out value="${language.creator}"/></td> 
	    </tr>
	    <tr>
	      <th scope="row">Version:</th>
	      <td colspan="2"><c:out value="${language.version}"/></td>
	    </tr>
	  </tbody>
	</table>
	<div id="btn-div">
		<a href="/languages/edit/${language.id}/updating" class="btn btn-secondary" role="button">Edit</a>
		<form action="/languages/${language.id}/delete" method="post">
    		  <input type="hidden" name="_method" value="delete">
   			  <input type="submit" value="Delete" class="btn btn-danger">
		</form>
		<a href="/languages" class="btn btn-primary" role="button">Go Back</a>
	</div>

</body>
</html>