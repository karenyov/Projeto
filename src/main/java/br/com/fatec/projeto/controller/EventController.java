package br.com.fatec.projeto.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import br.com.fatec.projeto.dao.CategoryDAO;
import br.com.fatec.projeto.dao.EventDAO;
import br.com.fatec.projeto.model.Category;
import br.com.fatec.projeto.model.Event;

/**
 * @author Karen
 *
 *         30 de ago de 2015
 */
@SuppressWarnings("serial")
@Controller
public class EventController extends HttpServlet {

	@Autowired
	private EventDAO eventDao;

	@Autowired
	private CategoryDAO categoryDao;

	ModelAndView modelCategory = new ModelAndView("Event/form");

	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public ModelAndView event() throws Exception {

		ModelAndView model = new ModelAndView("Event/home");
		return model;
	}

	@RequestMapping("/eventMap")
	public ModelAndView eventMap() throws Exception {
		ModelAndView model = new ModelAndView("Event/formMap");
		return model;
	}
	
	@RequestMapping(value = "/deleteEvent", method = RequestMethod.GET)
	public ModelAndView deleteEvent(HttpServletRequest request) {
		int eventId = Integer.parseInt(request.getParameter("id"));
		eventDao.remove(eventId);
		return new ModelAndView("redirect:/listEvent");
	}
	
	@RequestMapping(value = "/listEvent", method = RequestMethod.GET)
	public ModelAndView listEvent(HttpServletRequest request) {
		List<Event> listEvent = eventDao.findAll();
		List<Event> listEventUser = new ArrayList<Event>(); 
		
		int idUser = Integer.parseInt(request.getParameter("idUser"));
		
		for (int i = 0; i < listEvent.size(); i++) {
			if (listEvent.get(i).getUser_id() == idUser) {
				listEventUser.add(listEvent.get(i));
			}
		}
		ModelAndView model = new ModelAndView("Event/list");
		model.addObject("eventList", listEventUser);
		return model;
	}

	@RequestMapping("/eventOk")
	public ModelAndView eventOk() throws Exception {
		ModelAndView model = new ModelAndView("Event/formOk");
		return model;
	}
	
	@RequestMapping(value = "/editEvent", method = RequestMethod.GET)
	public ModelAndView editEvent(HttpServletRequest request) {
		int eventId = Integer.parseInt(request.getParameter("id"));
		Event event = eventDao.findById(eventId);
		
		List<Category> listCategory = categoryDao.findAll();
		ModelAndView model = new ModelAndView("Event/form");
		
		model.addObject("event", event);
		model.addObject("categoryList", listCategory);
		return model;
	}

	@RequestMapping(value = "/newEvent", method = RequestMethod.GET)
	public ModelAndView newEvent(HttpServletRequest request) throws Exception {
		String latitude = request.getParameter("txtLatitude");
		String longitude = request.getParameter("txtLongitude");

		List<Category> listCategory = categoryDao.findAll();

		modelCategory.addObject("event", new Event());
		modelCategory.addObject("categoryList", listCategory);

		modelCategory.addObject("latitude", latitude);
		modelCategory.addObject("longitude", longitude);

		return modelCategory;
	}

	@RequestMapping(value = "/saveEvent", method = RequestMethod.POST)
	public ModelAndView saveEvent(@Valid @ModelAttribute("event") Event event, BindingResult result,
			HttpServletRequest request) {

		// tratando os erros
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

		// ModelAndView model = new ModelAndView("Event/form");

		if (data_inicioDate.after(data_terminoDate)) {
			// Data de inicio deve vir antes da data de termino
			modelCategory.addObject("erroData1", "sim");
			return modelCategory;
		}

		eventDao.saveOrUpdate(event);

		return new ModelAndView("redirect:/eventOk");
	}

	private List<String> events() {
		List<Event> eventos = eventDao.findAll();

		List<String> strings = new ArrayList<String>();

		for (int i = 0; i < eventos.size(); i++) {
			int idCategory = Integer.parseInt(eventos.get(i).getCategory());
			Category category = categoryDao.findById(idCategory);

			DateFormat fmt = new SimpleDateFormat("dd/MM/yyyy");
			String inicio = fmt.format(eventos.get(i).getData_inicio().getTime());

			String termino = fmt.format(eventos.get(i).getData_termino().getTime());

			strings.add(eventos.get(i).getTitle() + "," + eventos.get(i).getLatitude() + ","
					+ eventos.get(i).getLongitude() + "," + eventos.get(i).getOption() + "," + category.getDescription()
					+ "," + eventos.get(i).getDescription() + "," + inicio + "," + termino + ","
					+ eventos.get(i).getUser_id() +","+ eventos.get(i).getId());
		}

		return strings;
	}

	@RequestMapping("/eventJSON")
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

		List<String> data = events();
		Gson gson = new Gson();
		String json = gson.toJson(data);

		response.getWriter().write(json);
		response.getWriter().close();

	}

}