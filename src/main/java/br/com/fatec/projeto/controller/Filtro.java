package br.com.fatec.projeto.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author Karen
 *
 *         11 de out de 2015
 */

/**
 * Servlet Filter implementation class Filtro
 */
@WebFilter(urlPatterns = { "/loginHome",
		"/deleteUser", "/listUser", "/editUser", "/detalhesUser",
		"/newCategory", "/editCategory", "/deleteCategory", "/listCategory", "/formOkCategory", "/homeCategory", "/detalhesCategory",
		"/eventMap","/newEvent", "/saveEvent",
		"" })
public class Filtro implements Filter {

	/**
	 * Default constructor.
	 */
	public Filtro() {

	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {

	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// place your code here

		// pass the request along the filter chain

		HttpServletRequest ht = (HttpServletRequest) request;

		HttpSession session = ht.getSession();

		Object user = session.getAttribute("usuarioLogado");

		if (user == null) {
			ht.getRequestDispatcher("/loginUser").forward(request, response);
		} else {
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		
	}
}