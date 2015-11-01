package br.com.fatec.projeto.controller;

/**
 * @author Karen
 *
 * 24 de jul de 2015
 */

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

import br.com.fatec.projeto.dao.UserDAO;
import br.com.fatec.projeto.model.User;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;

	@RequestMapping("/formOk")
	public ModelAndView formOk() throws Exception {
		ModelAndView model = new ModelAndView("User/formOk");
		return model;
	}
	
	@RequestMapping("/homeUser")
	public ModelAndView homeUser() throws Exception {
		ModelAndView model = new ModelAndView("User/home");
		return model;
	}

	@RequestMapping(value = "/detalhesUser", method = RequestMethod.GET)
	public ModelAndView detalhesUser(HttpServletRequest request) {
		int userId = Integer.parseInt(request.getParameter("id"));
		User user = userDao.findById(userId);
		ModelAndView model = new ModelAndView("User/detalhes");
		model.addObject("user", user);
		return model;
	}
	
	@RequestMapping("/listUser")
	public ModelAndView listUser() throws Exception {
		List<User> listUsers = userDao.findAll();
		ModelAndView model = new ModelAndView("User/list");
		model.addObject("userList", listUsers);
		return model;
		
	}

	@RequestMapping(value = "/newUser", method = RequestMethod.GET)
	public ModelAndView newUser() {
		ModelAndView model = new ModelAndView("User/form");
		model.addObject("user", new User());
		return model;
	}

	@RequestMapping(value = "/editUser", method = RequestMethod.GET)
	public ModelAndView editUser(HttpServletRequest request) {
		int userId = Integer.parseInt(request.getParameter("id"));
		User user = userDao.findById(userId);
		ModelAndView model = new ModelAndView("User/form");
		model.addObject("user", user);
		return model;
	}

	@RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
	public ModelAndView deleteUser(HttpServletRequest request) {
		int userId = Integer.parseInt(request.getParameter("id"));
		userDao.remove(userId);
		return new ModelAndView("redirect:/listUser");
	}

	@RequestMapping(value = "/saveUser", method = RequestMethod.POST)
	public ModelAndView saveUser(@Valid @ModelAttribute("user") User user, BindingResult result) {
		if (result.hasErrors()) {
			if (userDao.findEmail(user.getEmail()) == true) {
				ModelAndView model = new ModelAndView("User/form");
				model.addObject("erroEmail", "sim");
				return model;
			}
			return new ModelAndView("User/form");
		}
		if (userDao.findEmail(user.getEmail()) == true) {
			ModelAndView model = new ModelAndView("User/form");
			model.addObject("erroEmail", "sim");
			return model;
		}
		userDao.saveOrUpdate(user);
		return new ModelAndView("redirect:/formOk");
	}
}
