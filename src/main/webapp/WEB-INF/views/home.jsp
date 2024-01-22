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
            background-color: #f0f0f0;
            background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiTll5lTpXXDLP_PMwyoOJ-gdCo4gxDwNOiQ&usqp=CAU'); 
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            animation: backgroundAnimation 20s infinite linear; 
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
		style="background-image: url('data:image/jpeg;base64,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'); background-size: cover; position: relative;">
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