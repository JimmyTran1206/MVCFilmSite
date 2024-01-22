package com.skilldistillery.film.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FilmResultController {

	@RequestMapping("/deletefilmresult.do")
	public String deleteFilmResult() {
		return "WEB-INF/views/display-message.jsp";
	}
	
	@RequestMapping(path = "displaymessage.do", method = RequestMethod.GET)
	public String displayMessage() {
	    return "WEB-INF/views/display-message.jsp";
	}

}
