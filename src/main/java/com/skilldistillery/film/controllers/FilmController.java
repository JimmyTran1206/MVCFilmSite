package com.skilldistillery.film.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.film.database.FilmDAO;
import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

@Controller
public class FilmController {
//TODO Complete Controller
	
@Autowired
private FilmDAO filmDAO;

@RequestMapping("")
public String home() {
	return "WEB-INF/views/home.jsp";
}
	
@RequestMapping(path="viewfilmbyid.do")
public ModelAndView viewFilmById(@RequestParam("id") int id) {
	ModelAndView mv = new ModelAndView();
	Film film = filmDAO.findFilmById(id);
	List<String> listFilm= new ArrayList<>();
	try {
		listFilm.add(film.toString());	
	} catch (NullPointerException e) {
		listFilm.add(String.format("<h2>No film match the id %d</h2>", id));
	}
	
	mv.addObject("listFilm", listFilm);
	mv.setViewName("WEB-INF/views/viewfilm.jsp");
	return mv;
}
	
	
	// TODO : Implement a request handler for:
		// path "GetStateData.do"
		// params "name"
		// method GET
		// return : ModelAndView
		// view : "WEB-INF/result.jsp"
		// object : "state", StateDAO.getStateByName
//	@RequestMapping
	
	// TODO : Implement a request handler for:
		// path "GetStateData.do"
		// params "abbr"
		// method GET
		// return : ModelAndView
		// view : "WEB-INF/result.jsp"
		// object : "state", StateDAO.getStateByAbbreviation
//	@RequestMapping

}
