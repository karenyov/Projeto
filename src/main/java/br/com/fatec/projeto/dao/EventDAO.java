package br.com.fatec.projeto.dao;

import java.util.List;

import br.com.fatec.projeto.model.Event;

/**
 * @author Karen
 *
 *         10 de out de 2015
 */

public interface EventDAO {
	
	public void saveOrUpdate(Event event);
	
	public Event findById(int id);

	public List<Event> findAll();

	public void remove(int id);

}
