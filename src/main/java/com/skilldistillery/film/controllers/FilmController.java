package com.skilldistillery.film.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.film.database.FilmDAO;
import com.skilldistillery.film.entities.Film;

@Controller
public class FilmController {

	@Autowired
	private FilmDAO filmDAO;

	@RequestMapping("")
	public String home() {
		return "WEB-INF/views/home.jsp";
	}

	@RequestMapping("home.do")
	public String returnHome() {
		return "WEB-INF/views/home.jsp";
	}

	@RequestMapping(path = "viewfilmbyid.do")
	public ModelAndView viewFilmById(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		Film film = filmDAO.findFilmById(id);
		List<Film> listFilm = new ArrayList<>();
		if (film != null) {
			listFilm.add(film);
		} else {
			listFilm.add(null); // Add a null film to indicate no match
		}

		mv.addObject("listFilm", listFilm);
		mv.setViewName("WEB-INF/views/viewfilm.jsp");
		return mv;
	}

	@RequestMapping(path = "insertfilm.do")
	public ModelAndView insertFilm(Film film) {
		ModelAndView mv = new ModelAndView();
		List<Film> listFilm = new ArrayList<>();
		Film insertedFilm = filmDAO.createFilm(film); // insert the film, get the id.
		Film retrievedFilm = filmDAO.findFilmById(insertedFilm.getId()); // retrieve the new film by Id to update
																			// language field
		if (film != null) {
			listFilm.add(retrievedFilm);
		} else {
			listFilm.add(null); // Add a null film to indicate no match
		}
		mv.addObject("listFilm", listFilm);
		mv.setViewName("WEB-INF/views/viewfilm.jsp");
		return mv;
	}

	@RequestMapping(path = "viewfilmbykeyword.do")
	public ModelAndView viewFilmByKeyword(@RequestParam("keyword") String keyword) {
		ModelAndView mv = new ModelAndView();
		List<Film> listFilm = filmDAO.findFilmBySearchKeyword(keyword);
		if (listFilm.isEmpty()) {
			listFilm.add(null);
		}
		mv.addObject("listFilmSize", listFilm.size());
		mv.addObject("listFilm", listFilm);
		mv.setViewName("WEB-INF/views/viewfilm.jsp");
		return mv;
	}

	@RequestMapping(path = "addfilm.do", method = RequestMethod.GET)
	public String showAddFilmForm(Model model) {
		// Display the form for adding a new film
		model.addAttribute("film", new Film());
		return "WEB-INF/views/addFilm.jsp";
	}

	@RequestMapping(path = "addfilm.do", method = RequestMethod.POST)
	public String addFilm(@ModelAttribute("film") Film film) {
		// Handle form submission and add new film
		filmDAO.createFilm(film);
		return "redirect:viewfilmbyid.do?id=" + film.getId();
	}

	@RequestMapping(path = "deletefilm.do", method = RequestMethod.GET)
	public String showDeleteFilmForm(@RequestParam("id") int id, Model model) {
		// Display the form for deleting a film
		Film film = filmDAO.findFilmById(id);
		model.addAttribute("film", film);
		return "WEB-INF/views/deleteFilm.jsp";
	}

	@RequestMapping(path = "deletefilm.do", method = RequestMethod.POST)
	public ModelAndView deleteFilm(@RequestParam("id") int filmId) {
		ModelAndView mv = new ModelAndView();
		Film film = filmDAO.findFilmById(filmId);

		if (film != null) {
			boolean isDeleted = filmDAO.deleteFilm(film);
			if (isDeleted) {
				mv.addObject("message", "Film deleted successfully.");
			} else {
				mv.addObject("error", "Error deleting film.");
			}
		} else {
			mv.addObject("error", "Film not found.");
		}

		mv.setViewName("redirect:/home.do");
		return mv;
	}
}
