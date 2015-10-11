package br.com.fatec.projeto.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.fatec.projeto.dao.CategoryDAO;
import br.com.fatec.projeto.dao.EventDAO;
import br.com.fatec.projeto.model.Category;
import br.com.fatec.projeto.model.Event;

/**
 * @author Karen
 *
 *         30 de ago de 2015
 */
@Controller
public class EventController {

	@Autowired
	private EventDAO eventDao;
	
	@Autowired
	private CategoryDAO categoryDao;

	@RequestMapping("/event")
	public ModelAndView event() throws Exception {
		ModelAndView model = new ModelAndView("Event/home");
		return model;
	}
	
	@RequestMapping("/eventMap")
	public ModelAndView eventMap() throws Exception {
		ModelAndView model = new ModelAndView("Event/formMap");
		return model;
	}

	@RequestMapping(value = "/newEvent", method = RequestMethod.GET)
	public ModelAndView newEvent() throws Exception {
		
		List<Category> listCategory = categoryDao.findAll();
		
		ModelAndView model = new ModelAndView("Event/form");
		
		model.addObject("event", new Event());
		model.addObject("categoryList", listCategory);
		
		return model;
	}

	@RequestMapping(value = "/saveEvent", method = RequestMethod.POST)
	public ModelAndView saveEvent(@Valid @ModelAttribute("event") Event event, BindingResult result, HttpServletRequest request) {	
		
		//tratando os erros
		String data_inicio = request.getParameter("data_inicio");
		String data_termino = request.getParameter("data_termino");
		
		SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
		
		Date data_inicioDate = new Date();
		Date data_terminoDate = new Date();
		
		try {
			data_inicioDate = formato.parse(data_inicio);
			data_terminoDate = formato.parse(data_termino);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		ModelAndView model = new ModelAndView("Event/form");
		
		if (data_inicioDate.after(data_terminoDate)) {
			//Data de inicio deve vir antes da data de termino
			model.addObject("erroData1", "sim");
			return model;
		}

		eventDao.saveOrUpdate(event);
		return new ModelAndView("redirect:/");
	}

}
