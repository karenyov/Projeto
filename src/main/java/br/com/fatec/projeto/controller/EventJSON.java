package br.com.fatec.projeto.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;

import br.com.fatec.projeto.dao.EventDAO;
import br.com.fatec.projeto.model.Event;

import java.util.*;

/**
 * Servlet implementation class IndiaStates
 */
@WebServlet("/eventJSON")
public class EventJSON extends HttpServlet {

	@Autowired
	private EventDAO eventDao;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");

		List<Event> data = eventDao.findAll();

		Gson gson = new Gson();
		String json = gson.toJson(data);

		response.getWriter().write(json);
		response.getWriter().close();

	}

}