package br.com.fatec.projeto.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
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
	public List<Event> findAll() {
		@SuppressWarnings("unchecked")
		List<Event> listEvent = (List<Event>) sessionFactory.getCurrentSession().createCriteria(Event.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

		return listEvent;
	}

	@Override
	@Transactional
	public void remove(int id) {
		Event eventToDelete = new Event();
		eventToDelete.setId(id);
		sessionFactory.getCurrentSession().delete(eventToDelete);
	}

	@Override
	@Transactional
	public Event findById(int id) {
		String hql = "from Event where id=" + id;
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		@SuppressWarnings("unchecked")
		List<Event> listEvent = (List<Event>) query.list();

		if (listEvent != null && !listEvent.isEmpty()) {
			return listEvent.get(0);
		}

		return null;
	}

	@Override
	@Transactional
	public void saveOrUpdate(Event event) {
		sessionFactory.getCurrentSession().saveOrUpdate(event);
	}

}
