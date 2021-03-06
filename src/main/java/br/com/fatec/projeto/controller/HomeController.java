package br.com.fatec.projeto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@RequestMapping("/")
	public ModelAndView handleRequest() throws Exception {
		ModelAndView model = new ModelAndView("home");
		return model;
	}

	@RequestMapping("/contact")
	public ModelAndView contact() throws Exception {
		ModelAndView model = new ModelAndView("Contact/contact");
		return model;
	}
	
	@RequestMapping("/pessoas")
	public ModelAndView pessoas() throws Exception {
		ModelAndView model = new ModelAndView("Pessoas/home");
		return model;
	}
	
	@RequestMapping("/seguranca")
	public ModelAndView seguranca() throws Exception {
		ModelAndView model = new ModelAndView("Seguranca/home");
		return model;
	}
	
	@RequestMapping("/empresa")
	public ModelAndView empresa() throws Exception {
		ModelAndView model = new ModelAndView("Empresa/home");
		return model;
	}
	
	@RequestMapping("/saibaMais")
	public ModelAndView saibaMais() throws Exception {
		ModelAndView model = new ModelAndView("Event/saibaMais");
		return model;
	}
}
