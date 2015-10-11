package br.com.fatec.projeto.dao;

import java.util.List;

import br.com.fatec.projeto.model.Category;

/**
 * @author Karen
 *
 *         10 de out de 2015
 */

public interface CategoryDAO {

	public void saveOrUpdate(Category category);

	public Category findById(int id);

	public List<Category> findAll();

	public void remove(int id);

	public boolean findCategory(String description);
}
