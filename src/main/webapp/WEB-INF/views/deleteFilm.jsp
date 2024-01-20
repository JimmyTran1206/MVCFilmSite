<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<title>Delete Film</title>
</head>
<body>
	<header>
		<h1>Delete Film</h1>
	</header>
	<main>
		<form action="deletefilm.do" method="post">
			<input type="hidden" name="id" value="${film.id}" />

			<h2>Confirm Deletion</h2>
			<p>Are you sure you want to delete the film with ID #${film.id} -
				${film.title}?</p>

			<button type="submit" class="btn btn-danger">Delete</button>
			<a href="home.do" class="btn btn-secondary">Cancel</a>
		</form>
	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>
