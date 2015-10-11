package br.com.fatec.projeto.dao;



/**
 * @author Karen
 *
 * 24 de jul de 2015
 */

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import br.com.fatec.projeto.model.User;
/**
 * @author Karen
 *
 * 11 de out de 2015
 */

public class UserDAOImpl implements UserDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public UserDAOImpl() {

	}

	public UserDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	@Transactional
	public List<User> findAll() {
		@SuppressWarnings("unchecked")
		List<User> listUser = (List<User>) sessionFactory.getCurrentSession().createCriteria(User.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listUser;
	}

	@Override
	@Transactional
	public void saveOrUpdate(User user) {
		sessionFactory.getCurrentSession().saveOrUpdate(user);
	}

	@Override
	@Transactional
	public void remove(int id) {
		User userToDelete = new User();
		userToDelete.setId(id);
		sessionFactory.getCurrentSession().delete(userToDelete);
	}

	@Override
	@Transactional
	public User findById(int id) {
		String hql = "from User where id=" + id;
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		@SuppressWarnings("unchecked")
		List<User> listUser = (List<User>) query.list();

		if (listUser != null && !listUser.isEmpty()) {
			return listUser.get(0);
		}

		return null;
	}

	@Override
	@Transactional
	public User findByEmail(String email) {
		Session session = sessionFactory.openSession();
		String SQL_QUERY = " from User as o where o.email=?";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter(0, email);

		@SuppressWarnings("unchecked")
		List<User> listUser = (List<User>) query.list();

		if (listUser != null && !listUser.isEmpty()) {
			return listUser.get(0);
		}
		return null;

	}

	@SuppressWarnings("rawtypes")
	@Override
	@Transactional
	public boolean checkLogin(String email, String password) {
		Session session = sessionFactory.openSession();
		boolean userFound = false;
		// Query using Hibernate Query Language
		String SQL_QUERY = " from User as o where o.email=?  and o.password=?";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter(0, email);
		query.setParameter(1, password);
		List list = query.list();

		if ((list != null) && (list.size() > 0)) {
			userFound = true;
		}

		session.close();
		return userFound;
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	@Transactional
	public boolean findEmail(String email) {
		Session session = sessionFactory.openSession();
		boolean emailFound = false;
		// Query using Hibernate Query Language
		String SQL_QUERY = " from User as o where o.email=?";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter(0, email);
		List list = query.list();

		if ((list != null) && (list.size() > 0)) {
			emailFound = true;
		}

		session.close();
		return emailFound;
	}

}
