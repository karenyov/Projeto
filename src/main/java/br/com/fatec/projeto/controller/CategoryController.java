package br.com.fatec.projeto.controller;

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
import br.com.fatec.projeto.model.Category;

/**
 * @author Karen
 *
 *         10 de out de 2015
 */

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryDAO categoryDao;
	
	@RequestMapping("/formOkCategory")
	public ModelAndView formOkCategory() throws Exception {
		ModelAndView model = new ModelAndView("Category/formOk");
		return model;
	}
	
	@RequestMapping("/homeCategory")
	public ModelAndView homeCategory() throws Exception {
		ModelAndView model = new ModelAndView("Category/home");
		return model;
	}
	
	@RequestMapping(value = "/newCategory", method = RequestMethod.GET)
	public ModelAndView newCategory() {
		ModelAndView model = new ModelAndView("Category/form");
		model.addObject("category", new Category());
		return model;
	}
	
	@RequestMapping("/listCategory")
	public ModelAndView listCategory() throws Exception {
		List<Category> listCategory = categoryDao.findAll();
		ModelAndView model = new ModelAndView("Category/list");
		model.addObject("categoryList", listCategory);
		return model;
	}
	
	@RequestMapping(value = "/editCategory", method = RequestMethod.GET)
	public ModelAndView editCategory(HttpServletRequest request) {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		Category category = categoryDao.findById(categoryId);
		ModelAndView model = new ModelAndView("Category/form");
		model.addObject("category", category);
		return model;
	}
	
	@RequestMapping(value = "/detalhesCategory", method = RequestMethod.GET)
	public ModelAndView detalhesCategory(HttpServletRequest request) {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		Category category = categoryDao.findById(categoryId);
		ModelAndView model = new ModelAndView("Category/detalhes");
		model.addObject("category", category);
		return model;
	}
	
	@RequestMapping(value = "/deleteCategory", method = RequestMethod.GET)
	public ModelAndView deleteCategory(HttpServletRequest request) {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		categoryDao.remove(categoryId);
		return new ModelAndView("redirect:/listCategory");
	}
	
	@RequestMapping(value = "/saveCategory", method = RequestMethod.POST)
	public ModelAndView saveCategory(@Valid @ModelAttribute("category") Category category, BindingResult result) {
		
		if (categoryDao.findCategory(category.getDescription()) == true) {
			ModelAndView model = new ModelAndView("Category/form");
			model.addObject("erroCategory", "sim");
			return model;
		}
		
		categoryDao.saveOrUpdate(category);
		return new ModelAndView("redirect:/formOkCategory");
	}

}
