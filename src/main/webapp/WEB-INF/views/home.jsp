<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MVC Film Site</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>
	<header>
		<h1>MVC Film Site</h1>
	</header>
	<main>
		<div class="accordion" id="accordionMain">
			<!-- Search film by Id -->
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingOne">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseOne"
						aria-expanded="false" aria-controls="collapseOne">Search
						film by Id</button>
				</h2>
				<div id="collapseOne" class="accordion-collapse collapse"
					aria-labelledby="headingOne" data-bs-parent="#accordionMain">
					<div class="accordion-body">
						<form action="viewfilmbyid.do" method="GET">
							<div class="form-group">
								<label for="filmId">Film Id</label> <input type="number"
									class="form-control" placeholder="Enter the film id" name="id">
								<small class="form-text text-muted">Enter an integer
									value representing a film id</small>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>

			<!-- Search film by keyword -->
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingTwo">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseTwo"
						aria-expanded="false" aria-controls="collapseTwo">Search
						film by keyword</button>
				</h2>
				<div id="collapseTwo" class="accordion-collapse collapse"
					aria-labelledby="headingTwo" data-bs-parent="#accordionMain">
					<div class="accordion-body">
						<form action="viewfilmbykeyword.do" method="GET">
							<div class="form-group">
								<label for="filmId">Film keyword</label> <input type="text"
									class="form-control" placeholder="Enter a keyword"
									name="keyword"> <small class="form-text text-muted">Enter
									a keyword to search for in film title and description</small>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>

			<!-- Add new film -->
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingThree">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseThree"
						aria-expanded="false" aria-controls="collapseThree">Add a
						new film</button>
				</h2>
				<div id="collapseThree" class="accordion-collapse collapse"
					aria-labelledby="headingThree" data-bs-parent="#accordionMain">
					<div class="accordion-body">
						<form action="insertfilm.do" method="POST">
							<div class="form-group">
								<label for="filmTitle">Film Title*</label> <input id="filmTitle"
									type="text" class="form-control" placeholder="Enter a title"
									name="title" required> <small
									class="form-text text-muted">Enter a film title to be
									added to the database</small>
							</div>
							<div class="form-group">
								<label for="filmDescription">Film Description*</label>
								<textarea id="filmDescription" class="form-control"
									placeholder="Enter a description" name="description" required></textarea>

								<small class="form-text text-muted">Enter a film
									description to be added to the database</small>
							</div>
							<div class="form-group">
								<label for="filmReleaseYear">Release Year*</label> <input
									id="filmReleaseYear" type="number" class="form-control"
									placeholder="Enter the release year" name="releaseYear"
									required> <small class="form-text text-muted">Enter
									the film release year</small>
							</div>
							<div class="form-group">
								<label for="filmLanguage">Language</label> <select
									id="filmLanguage" class="form-control" name="languageId">
									<option value="1" selected>English</option>
									<option value="2">Italian</option>
									<option value="3">Japanese</option>
									<option value="4">Mandarin</option>
									<option value="5">French</option>
									<option value="6">German</option>
								</select> <small class="form-text text-muted">Select the film
									language</small>
							</div>

							<div class="form-group">
								<label for="filmRentalDuration">Rental duration</label> <input
									id="filmRentalDuration" type="number" class="form-control"
									placeholder="Enter the rental duration" name="rentalDuration"
									value=3> <small class="form-text text-muted">Enter
									the rental duration</small>
							</div>

							<div class="form-group">
								<label for="filmRentalRate">Rental Rate</label> <input
									id="filmRentalRate" type="number" step="0.01"
									class="form-control" placeholder="Enter the rental rate"
									name="rentalRate" value=4.99> <small
									class="form-text text-muted">Enter the rental rate</small>
							</div>

							<div class="form-group">
								<label for="filmLength">Length</label> <input id="filmLength"
									type="number" class="form-control"
									placeholder="Enter film length" name="length" value=90>
								<small class="form-text text-muted">Enter the film
									length</small>
							</div>

							<div class="form-group">
								<label for="filmReplacementCost">Replacement Cost</label> <input
									id="filmReplacementCost" type="number" step="0.01"
									class="form-control" placeholder="Enter the replacement cost"
									name="replacementCost" value=19.99> <small
									class="form-text text-muted">Enter the replacement cost</small>
							</div>

							<div class="form-group">
								<label for="filmRating">Rating</label> <select id="filmRating"
									class="form-control" name="rating">
									<option value="G" selected>G</option>
									<option value="PG">PG</option>
									<option value="PG13">PG13</option>
									<option value="R">R</option>
									<option value="NC17">NC17</option>
								</select> <small class="form-text text-muted">Select the film
									rating</small>
							</div>

							<button type="submit" class="btn btn-primary">Add new
								film</button>
						</form>
					</div>
				</div>
			</div>

			<!-- Update Film -->
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingUpdateFilm">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseUpdateFilm"
						aria-expanded="false" aria-controls="collapseUpdateFilm">
						Update Film</button>
				</h2>
				<div id="collapseUpdateFilm" class="accordion-collapse collapse"
					aria-labelledby="headingUpdateFilm" data-bs-parent="#accordionMain">
					<div class="accordion-body">
						<jsp:include page="updatefilm.jsp" />
					</div>
				</div>
			</div>

			<!-- Delete Film -->
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingDeleteFilm">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseDeleteFilm"
						aria-expanded="false" aria-controls="collapseDeleteFilm">
						Delete Film</button>
				</h2>
				<div id="collapseDeleteFilm" class="accordion-collapse collapse"
					aria-labelledby="headingDeleteFilm" data-bs-parent="#accordionMain">
					<div class="accordion-body">
						<jsp:include page="deleteFilm.jsp" />
					</div>
				</div>
			</div>
		</div>
	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>
