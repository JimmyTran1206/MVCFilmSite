<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<title>Film detail</title>
</head>
<body>
	<header>
		<h1>Film details</h1>
	</header>
	<main>
		<c:if test="${listFilmSize>1}">
			<h2>There are ${listFilmSize} films matched your search</h2>
		</c:if>

		<c:if test="${listFilmSize==1}">
			<c:forEach var="film" items="${listFilm}">
				<c:if test="${not empty film}">
					<h2>There is ${listFilmSize} film matched your search</h2>
				</c:if>
			</c:forEach>
		</c:if>


		<c:forEach var="film" items="${listFilm}">
			<c:if test="${empty film}">
				<h2>Cannot find the film specified</h2>
			</c:if>

			<c:if test="${not empty film}">
				<ul>
					<li>Film id: #${film.id}</li>
					<li>Title: ${film.title}</li>
					<li>Release Year: ${film.releaseYear}</li>
					<li>Rating: ${film.rating}</li>
					<li>Language: ${film.language}</li>
					<li>Description: ${film.description}</li>
					<li>Casting Actors:</li>
					<ol>
						<c:forEach var="actor" items="${film.actorList}">
							<li>${actor.firstName}${actor.lastName}</li>
						</c:forEach>
					</ol>
				</ul>
				<hr />
			</c:if>

		</c:forEach>


		<a href="home.do"> Return to the main menu</a>
	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>
