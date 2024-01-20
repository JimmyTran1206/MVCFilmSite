<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<header>
		<h1>MVC Film Site</h1>
	</header>
	<main>
		<div class="accordion" id="accordionMain">
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

						<form action = "viewfilmbyid.do" method="GET">
							<div class="form-group">
								<label for="filmId">Film Id</label> <input
									type="text" class="form-control" placeholder="Enter the film id" name="id">
								<small class="form-text text-muted">Enter an integer value representing a film id</small>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
			
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingTwo">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseTwo"
						aria-expanded="false" aria-controls="collapseTwo">
						Search film by keyword</button>
				</h2>
				<div id="collapseTwo" class="accordion-collapse collapse"
					aria-labelledby="headingTwo" data-bs-parent="#accordionMain">
					<div class="accordion-body">
						<form action = "viewfilmbykeyword.do" method="GET">
							<div class="form-group">
								<label for="filmId">Film keyword</label> <input
									type="text" class="form-control" placeholder="Enter a keyword" name="keyword">
								<small class="form-text text-muted">Enter a keyword to search for in film title and description</small>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
			
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingThree">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseThree"
						aria-expanded="false" aria-controls="collapseThree">
						Add a new film</button>
				</h2>
				<div id="collapseThree" class="accordion-collapse collapse"
					aria-labelledby="headingThree" data-bs-parent="#accordionMain">
					<div class="accordion-body">
						<form action = "insertfilm.do" method="POST">
							<div class="form-group">
								<label for="filmId">Film Title</label> <input
									type="text" class="form-control" placeholder="Enter a title" name="title">
								<small class="form-text text-muted">Enter a film title to be added to the database</small>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
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