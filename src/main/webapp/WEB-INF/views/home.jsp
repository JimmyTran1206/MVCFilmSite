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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	integrity="sha384-Jfn9j8b+E3t/AKm08TsdL3tiTlSv/HEP2zzLu0fNlUCGUHJ43JqG5pqD7XDblv2H"
	crossorigin="anonymous">

</head>
<style>

 body {
            /* Set background color as fallback in case the image is not loaded or supported */
            background-color: #f0f0f0;
            background-image: url('data:image/jpeg;base64,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'); /* Replace with the URL of your background image */
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            animation: backgroundAnimation 20s infinite linear; /* Adjust animation duration and other properties */
	opacity: 0.9;
        }

        @keyframes backgroundAnimation {
            0% {
                background-position: 0% 0%;
            }
            50% {
                background-position: 100% 100%;
            }
            100% {
                background-position: 0% 0%;
            }
        }

body {
	background-color: #f8f9fa;
}

header {
	background-color: #343a40;
	padding: 1rem;
	color: white;
	text-align: center;
}

main {
	margin-top: 2rem;
}

.accordion-item {
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 8px;
	margin-bottom: 1rem;
	overflow: hidden;
}

.accordion-button {
	background-color: #343a40;
}

.accordion-button:hover {
	background-color: #495057;
	color: white;
}

.btn-primary {
	background-color: #007bff;
	border: none;
}

.btn-primary:hover {
	background-color: #0056b3;
	color: white;
}
</style>
</head>
<body>
<body>

	<header
		style="background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQN7ZRcoaxNZWD_2KI-bbK3KLaS2fLQmgBjaw&usqp=CAU'); background-size: cover; position: relative;">
		<div class="overlay"></div>
		<div class="container text-white">
			<h1 class="fas fa-film">MVC Film Site</h1>
		</div>
	</header>


	<main class="container mt-5">
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
