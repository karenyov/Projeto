package br.com.fatec.projeto.controller;

import javax.servlet.http.HttpSession;
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
 * @author Karen
 *
 *         07 de set de 2015
 */

@Controller
public class LoginController {
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(value = "/loginUser", method = RequestMethod.GET)
	public ModelAndView newUser() {
		ModelAndView model = new ModelAndView("Login/login");
		model.addObject("user", new User());
		return model;
	}
	
	@RequestMapping("/termos")
	public ModelAndView termos() throws Exception {
		ModelAndView model = new ModelAndView("Login/termos");
		return model;
	}
	
	@RequestMapping(value = "/loginHome", method = RequestMethod.GET)
	public ModelAndView loginHome() {
		ModelAndView model = new ModelAndView("Login/home");
		model.addObject("user", new User());
		return model;
	}

	@RequestMapping(value = "/checkLogin", method = RequestMethod.POST)
	public ModelAndView checkLogin(@Valid @ModelAttribute("user") User user, BindingResult result,HttpSession session) {
		if (userDao.checkLogin(user.getEmail(), user.getPassword()) == true) {
			//dados corretos
			User userFound = new User();
			userFound = userDao.findByEmail(user.getEmail());
			session.setAttribute("usuarioLogado", userFound);
			
			ModelAndView model = new ModelAndView("redirect:/loginHome");
			return model;
		}
		ModelAndView model = new ModelAndView("Login/login");
		model.addObject("erroLogin", "sim");
		return model;
	}
	
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {		
		session.invalidate();
		return new ModelAndView("redirect:/");
	}

}
