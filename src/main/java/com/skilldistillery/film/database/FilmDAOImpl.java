package com.skilldistillery.film.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

@Repository
public class FilmDAOImpl implements FilmDAO {
	private static final String URL = "jdbc:mysql://localhost:3306/sdvid";
	private static final String USER = "student";
	private static final String PWD = "student";
	Connection conn;

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("Unable to load driver");
			System.out.println(e);
			e.printStackTrace();
			System.exit(1);
		}
	}

	public void startDBConnection() {
		try {
			conn = DriverManager.getConnection(URL, USER, PWD);
		} catch (SQLException e) {
			System.out.println("Cannot make connection to DB");
			System.out.println(e);
			e.printStackTrace();
			System.exit(1);

		}
	}

	public void closeDBConnection() {
		try {
			conn.close();
		} catch (SQLException e) {
			System.out.println("Cannot close DB connection");
			System.out.println(e);
			e.printStackTrace();
			System.exit(1);
		}
	}

	@Override
	public Film findFilmById(int filmId) {
		startDBConnection();

		Film film = null;
		String sql = "SELECT * " + " FROM film JOIN language ON film.language_id = language.id " + " WHERE film.id =?;";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, filmId);
			ResultSet filmResult = stmt.executeQuery();
			if (filmResult.next()) {
				film = new Film();
				film.setId(filmResult.getInt("id"));
				film.setTitle(filmResult.getString("title"));
				film.setDescription(filmResult.getString("description"));
				film.setReleaseYear(filmResult.getInt("release_year"));
				film.setLanguageId(filmResult.getString("language_id"));
				film.setRentalDuration(filmResult.getInt("rental_duration"));
				film.setRentalRate(filmResult.getDouble("rental_rate"));
				film.setLength(filmResult.getInt("length"));
				film.setReplacementCost(filmResult.getDouble("replacement_cost"));
				film.setRating(filmResult.getString("rating"));
				film.setSpecialFeatures(filmResult.getString("special_features"));
				film.setLanguage(filmResult.getString("name"));
				// setting actor list in the film
				film.setActorList(findActorsByFilmId(filmId));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		closeDBConnection();
		return film;
	}

	@Override
	public Actor findActorById(int actorId) {
		startDBConnection();
		Actor actor = null;
		String sql = "SELECT * FROM actor WHERE id=?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, actorId);
			ResultSet actorResult = stmt.executeQuery();
			if (actorResult.next()) {
				actor = new Actor();
				actor.setId(actorResult.getInt("id"));
				actor.setFirstName(actorResult.getString("first_name"));
				actor.setLastName(actorResult.getString("last_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		closeDBConnection();
		return actor;
	}

	@Override
	public List<Actor> findActorsByFilmId(int filmId) {
		startDBConnection();
		List<Actor> actorList = new ArrayList<>();
		String sql = "SELECT actor.id, actor.first_name, actor.last_name "
				+ " FROM actor JOIN film_actor ON actor.id=film_actor.actor_id " + " WHERE film_actor.film_id = ? ";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, filmId);
			ResultSet actorResult = stmt.executeQuery();
			while (actorResult.next()) {
				Actor actor = new Actor();
				actor.setId(actorResult.getInt("id"));
				actor.setFirstName(actorResult.getString("first_name"));
				actor.setLastName(actorResult.getString("last_name"));
				actorList.add(actor);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		closeDBConnection();
		return actorList;
	}

	@Override
	public List<Film> findFilmBySearchKeyword(String searchKeyword) {
		startDBConnection();
		List<Film> filmList = new ArrayList<Film>();
		String sql = "SELECT * " + " FROM film JOIN language ON film.language_id = language.id "
				+ " WHERE film.title LIKE ? OR film.description LIKE ?";
		String matchedText = "%" + searchKeyword + "%";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, matchedText);
			stmt.setString(2, matchedText);
			ResultSet filmResult = stmt.executeQuery();
			while (filmResult.next()) {
				Film film = new Film();
				film.setId(filmResult.getInt("id"));
				film.setTitle(filmResult.getString("title"));
				film.setDescription(filmResult.getString("description"));
				film.setReleaseYear(filmResult.getInt("release_year"));
				film.setLanguageId(filmResult.getString("language_id"));
				film.setRentalDuration(filmResult.getInt("rental_duration"));
				film.setRentalRate(filmResult.getDouble("rental_rate"));
				film.setLength(filmResult.getInt("length"));
				film.setReplacementCost(filmResult.getDouble("replacement_cost"));
				film.setRating(filmResult.getString("rating"));
				film.setSpecialFeatures(filmResult.getString("special_features"));
				film.setLanguage(filmResult.getString("name"));
				// setting actor list in the film
				film.setActorList(findActorsByFilmId(film.getId()));
				filmList.add(film);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		closeDBConnection();
		return filmList;
	}

	@Override
	public Film createFilm(Film film) {
		startDBConnection();
		try {
			conn.setAutoCommit(false); // START TRANSACTION
			String sql = "INSERT INTO film(" + "title, " + "description, " + "release_year,  " + "language_id, "
					+ "rental_duration, " + "rental_rate, " + "length," + "replacement_cost, " + "rating) "
					+ "VALUES (?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, film.getTitle());
			pstmt.setString(2, film.getDescription());
			pstmt.setInt(3, film.getReleaseYear());
			pstmt.setString(4, film.getLanguageId());
			pstmt.setInt(5, film.getRentalDuration());
			pstmt.setDouble(6, film.getRentalRate());
			pstmt.setInt(7, film.getLength());
			pstmt.setDouble(8, film.getReplacementCost());
			pstmt.setString(9, film.getRating());
			int insertCount = pstmt.executeUpdate();
			if (insertCount == 1) {
				ResultSet keys = pstmt.getGeneratedKeys();
				if (keys.next()) {
					int newFilmId = keys.getInt(1);
					film.setId(newFilmId); // Set Id for the new film added
				}
			} else {
				film = null;
			}
			conn.commit(); // COMMIT TRANSACTION

		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			throw new RuntimeException("Error inserting film " + film);
		}
		closeDBConnection();
		return film;
	}

	@Override
	public boolean deleteFilm(Film film) {
		startDBConnection();
		boolean isDeleted = false;
		try {
			conn.setAutoCommit(false); // START TRANSACTION
			String sql = "DELETE FROM film WHERE id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, film.getId());
			int deleteCount = pstmt.executeUpdate();
			if (deleteCount == 1) {
				isDeleted = true;
			}
			conn.commit(); // COMMIT TRANSACTION

		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			throw new RuntimeException("Error deleting film " + film);
		}
		closeDBConnection();
		return isDeleted;
	}

	@Override
	public boolean updateFilm(Film film) {
		Connection conn = null;

		try {
			conn = DriverManager.getConnection(URL, USER, PWD);
			conn.setAutoCommit(false); // START TRANSACTION

			String sql = "UPDATE film SET title=?, description=?, release_year=?, length=?, replacement_cost=?, rating=? "
					+ "WHERE id =?";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, film.getTitle());
			stmt.setString(2, film.getDescription());
			stmt.setInt(3, film.getReleaseYear());
			stmt.setInt(4, film.getLength());
			stmt.setDouble(5, film.getReplacementCost());
			stmt.setString(6, film.getRating());
			stmt.setInt(7, film.getId());

			int updateCount = stmt.executeUpdate();

			if (updateCount == 1) {
				sql = "DELETE FROM film_actor WHERE film_id = ?";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, film.getId());

				updateCount = stmt.executeUpdate();
				sql = "INSERT INTO film_actor (film_id, actor_id) VALUES (?,?)";
				stmt = conn.prepareStatement(sql);
				for (Actor actor : film.getActorList()) {
					stmt.setInt(1, film.getId());
					stmt.setInt(2, actor.getId());
					updateCount = stmt.executeUpdate();
				}
				conn.commit();
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			return false;
		}
		return true;
	}

}
