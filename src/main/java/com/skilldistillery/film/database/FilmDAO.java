package com.skilldistillery.film.database;

import java.util.List;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

public interface FilmDAO {
	public Film findFilmById(int filmId);

	public Actor findActorById(int actorId);

	public List<Actor> findActorsByFilmId(int filmId);

	public List<Film> findFilmBySearchKeyword(String searchKeyword);

	public Film createFilm(Film film);

	public boolean deleteFilm(Film film);

	public boolean updateFilm(Film film);

}
