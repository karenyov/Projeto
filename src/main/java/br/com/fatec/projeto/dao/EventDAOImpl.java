package br.com.fatec.projeto.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import br.com.fatec.projeto.model.Event;



/**
 * @author Karen
 *
 *         10 de out de 2015
 */

public class EventDAOImpl implements EventDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	public EventDAOImpl() {

	}

	public EventDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
	@Override
	@Transactional
	public void saveOrUpdate(Event event) {
		sessionFactory.getCurrentSession().saveOrUpdate(event);
	}

}
