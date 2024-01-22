<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Delete Film</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>

	<header>
		<h1>Delete Film</h1>
	</header>

	<main class="container mt-5">
		<c:choose>
			<c:when test="${empty deletedFilm}">
				<form action="deletefilm.do" method="post" class="mb-5">
					<div class="mb-3">
						<label for="filmId" class="form-label">Film ID:</label> <input
							type="text" name="id" class="form-control"
							placeholder="Enter Film ID" required>
					</div>

					<c:if test="${not empty message}">
						<div class="alert alert-success">${message}</div>
					</c:if>
					<c:if test="${not empty error}">
						<div class="alert alert-danger">${error}</div>
					</c:if>

					<c:if test="${not empty film}">
						<h2>Confirm Deletion</h2>
						<p>Are you sure you want to delete the film with ID
							#${film.id} - ${film.title}?</p>
					</c:if>

					<button type="submit" class="btn btn-danger">Delete</button>
					<a href="home.do" class="btn btn-secondary">Cancel</a>
				</form>
			</c:when>

			<c:when test="${not empty deletedFilm}">
				<div class="alert alert-success mt-3" role="alert">Film with
					ID #${deletedFilm.id} - ${deletedFilm.title} has been successfully
					deleted.</div>
				<a href="home.do" class="btn btn-primary mt-3">Return to Home</a>
			</c:when>

			<c:otherwise>
				<div class="alert alert-info mt-3" role="alert">No film has
					been deleted yet.</div>
			</c:otherwise>
		</c:choose>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
