package br.com.fatec.projeto.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import br.com.fatec.projeto.model.Category;

/**
 * @author Karen
 *
 *         10 de out de 2015
 */

public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public CategoryDAOImpl() {

	}

	public CategoryDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	@Transactional
	public List<Category> findAll() {
		@SuppressWarnings("unchecked")
		List<Category> listCategory = (List<Category>) sessionFactory.getCurrentSession().createCriteria(Category.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

		return listCategory;
	}

	@Override
	@Transactional
	public void remove(int id) {
		Category categoryToDelete = new Category();
		categoryToDelete.setId(id);
		sessionFactory.getCurrentSession().delete(categoryToDelete);
	}

	@Override
	@Transactional
	public void saveOrUpdate(Category category) {
		sessionFactory.getCurrentSession().saveOrUpdate(category);
	}

	@Override
	@Transactional
	public Category findById(int id) {
		String hql = "from Category where id=" + id;
		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		@SuppressWarnings("unchecked")
		List<Category> listCategory = (List<Category>) query.list();

		if (listCategory != null && !listCategory.isEmpty()) {
			return listCategory.get(0);
		}

		return null;
	}

	@SuppressWarnings("rawtypes")
	@Override
	@Transactional
	public boolean findCategory(String description) {
		Session session = sessionFactory.openSession();
		boolean categoryFound = false;
		// Query using Hibernate Query Language
		String SQL_QUERY = " from Category as o where o.description=?";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter(0, description);
		List list = query.list();

		if ((list != null) && (list.size() > 0)) {
			categoryFound = true;
		}

		session.close();
		return categoryFound;
	}

}
