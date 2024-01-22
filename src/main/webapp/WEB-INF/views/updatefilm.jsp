<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Update Film</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">



</head>
<body>

	<div class="container mt-5">
		<h2>Update Film</h2>

		<form action="updatefilm.do" method="POST" class="mb-5">
			<div class="mb-3">
				<label for="filmId" class="form-label">Film ID:</label> <input
					type="text" name="id" class="form-control"
					placeholder="Enter Film ID" required>
			</div>

			<div class="mb-3">
				<label for="title" class="form-label">Title:</label> <input
					type="text" name="title" class="form-control" value="${film.title}"
					required>
			</div>

			<div class="mb-3">
				<label for="description" class="form-label">Description:</label>
				<textarea name="description" class="form-control" required>${film.description}</textarea>
			</div>

			<div class="mb-3">
				<label for="releaseYear" class="form-label">Release Year:</label> <select
					name="releaseYear" class="form-select" required>
					<c:forEach begin="1900" end="2024" var="year">
						<option value="${year}"
							${film.releaseYear == year ? 'selected' : ''}>${year}</option>
					</c:forEach>
				</select>
			</div>

			<div class="mb-3">

				<label for="languageId" class="form-label">Language:</label> <select
					name="language" class="form-select" value="${film.language}"
					required>
					<option value="English"
						${film.language == 'English' ? 'selected' : ''}>English</option>
					<option value="Italian"
						${film.language == 'Italian' ? 'selected' : ''}>Italian</option>
					<option value="Japanese"
						${film.language == 'Japanese' ? 'selected' : ''}>Japanese</option>
					<option value="Mandarin"
						${film.language == 'Mandarin' ? 'selected' : ''}>Mandarin</option>
					<option value="French"
						${film.language == 'French' ? 'selected' : ''}>French</option>
					<option value="German"
						${film.language == 'German' ? 'selected' : ''}>German</option>
				</select>
			</div>

			<div class="mb-3">
				<label for="rentalDuration" class="form-label">Rental
					Duration (in days):</label> <input type="number" name="rentalDuration"
					class="form-control" value="${film.rentalDuration}" required>
			</div>

			<div class="mb-3">
				<label for="rentalRate" class="form-label">Rental Rate:</label> <input
					type="number" name="rentalRate" step="0.01" class="form-control"
					value="${film.rentalRate}" required>
			</div>

			<div class="mb-3">
				<label for="length" class="form-label">Length (in minutes):</label>
				<input type="number" name="length" class="form-control"
					value="${film.length}" required>
			</div>

			<div class="mb-3">
				<label for="replacementCost" class="form-label">Replacement
					Cost:</label> <input type="number" name="replacementCost" step="0.01"
					class="form-control" value="${film.replacementCost}" required>
			</div>

			<div class="mb-3">
				<label for="rating" class="form-label">Rating:</label> <select
					name="rating" class="form-select" required>
					<option value="G" ${film.rating == 'G' ? 'selected' : ''}>G</option>
					<option value="PG" ${film.rating == 'PG' ? 'selected' : ''}>PG</option>
					<option value="PG-13" ${film.rating == 'PG-13' ? 'selected' : ''}>PG-13</option>
					<option value="R" ${film.rating == 'R' ? 'selected' : ''}>R</option>
					<option value="NC-17" ${film.rating == 'NC-17' ? 'selected' : ''}>NC-17</option>
				</select>
			</div>

			<button type="submit" class="btn btn-primary">Update Film</button>
		</form>

		<c:if test="${not empty message}">
			<div class="alert alert-success" role="alert">${message}</div>
		</c:if>

		<c:if test="${not empty error}">
			<div class="alert alert-danger" role="alert">${error}</div>
		</c:if>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
