package br.com.fatec.projeto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Karen
 *
 * 30 de ago de 2015
 */
@Controller
public class EventController {
	
	@RequestMapping("/event")
	public ModelAndView event() throws Exception {
		ModelAndView model = new ModelAndView("Event/home");
		return model;
	}

}
