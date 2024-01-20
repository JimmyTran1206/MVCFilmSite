package com.skilldistillery.film.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.film.database.FilmDAO;

@Controller
public class FilmController {
//TODO Complete Controller
	
@Autowired
private FilmDAO filmDAO;

@RequestMapping("")
public String home() {
	return "WEB-INF/views/home.jsp";
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
