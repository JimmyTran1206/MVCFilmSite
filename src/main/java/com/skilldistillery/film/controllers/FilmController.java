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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
			listFilm.add(null);
		}

		mv.addObject("listFilm", listFilm);
		mv.setViewName("WEB-INF/views/viewfilm.jsp");
		return mv;
	}

	@RequestMapping(path = "insertfilm.do")
	public ModelAndView insertFilm(Film film) {
		ModelAndView mv = new ModelAndView();
		List<Film> listFilm = new ArrayList<>();
		Film insertedFilm = filmDAO.createFilm(film); 
		Film retrievedFilm = filmDAO.findFilmById(insertedFilm.getId()); 
																			
		if (film != null) {
			listFilm.add(retrievedFilm);
		} else {
			listFilm.add(null); 
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
		model.addAttribute("film", new Film());
		return "WEB-INF/views/addFilm.jsp";
	}

	@RequestMapping(path = "addfilm.do", method = RequestMethod.POST)
	public String addFilm(@ModelAttribute("film") Film film) {
		filmDAO.createFilm(film);
		return "redirect:viewfilmbyid.do?id=" + film.getId();
	}

	@RequestMapping(path = "deletefilm.do", method = RequestMethod.GET)
	public String showDeleteFilmForm(@RequestParam("id") int id, Model model) {
		Film film = filmDAO.findFilmById(id);
		model.addAttribute("film", film);
		return "WEB-INF/views/deleteFilm.jsp";
	}

	@RequestMapping(path = "deletefilm.do", method = RequestMethod.POST)
	public String deleteFilm(@RequestParam("id") int filmId, RedirectAttributes redirectAttributes) {
		Film film = filmDAO.findFilmById(filmId);

		if (film != null) {
			try {
				boolean isDeleted = filmDAO.deleteFilm(film);
				if (isDeleted) {
					redirectAttributes.addFlashAttribute("message", "Film deleted successfully.");
				} else {
					redirectAttributes.addFlashAttribute("error", "Error deleting film.");
				}
			} catch (Exception e) {
				redirectAttributes.addFlashAttribute("error", "An error occurred while deleting the film.");
			}
		} else {
			redirectAttributes.addFlashAttribute("error", "Film not found.");
		}

		return "forward:/WEB-INF/views/display-message.jsp";
	}

	@RequestMapping(path = "updatefilm.do", method = RequestMethod.GET)
	public String showUpdateFilmForm(@RequestParam("id") int id, Model model) {
		Film film = filmDAO.findFilmById(id);
		model.addAttribute("film", film);
		return "WEB-INF/views/updatefilm.jsp";
	}

	@RequestMapping(path = "updatefilm.do", method = RequestMethod.POST)
	public String updateFilm(@ModelAttribute("film") Film updatedFilm, Model model) {
		Film film = filmDAO.findFilmById(updatedFilm.getId());

		if (film != null) {
			film.setTitle(updatedFilm.getTitle());
			film.setDescription(updatedFilm.getDescription());
			film.setReleaseYear(updatedFilm.getReleaseYear());
			film.setLanguage(updatedFilm.getLanguage());
			film.setRentalDuration(updatedFilm.getRentalDuration());
			film.setRentalRate(updatedFilm.getRentalRate());
			film.setLength(updatedFilm.getLength());
			film.setReplacementCost(updatedFilm.getReplacementCost());
			film.setRating(updatedFilm.getRating());

			try {
				boolean isUpdated = filmDAO.updateFilm(film);
				if (isUpdated) {
					model.addAttribute("message", "Film updated successfully.");
				} else {
					model.addAttribute("error", "Error updating film.");
				}
			} catch (Exception e) {
				model.addAttribute("error", "An error occurred while updating the film.");
			}
		} else {
			model.addAttribute("error", "Film not found.");
		}

		List<Film> listFilm = new ArrayList<>();
		listFilm.add(film);
		model.addAttribute("listFilm", listFilm);

		return "WEB-INF/views/viewfilm.jsp";
	}

}
