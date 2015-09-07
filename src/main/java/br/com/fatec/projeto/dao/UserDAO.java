package br.com.fatec.projeto.dao;

import java.util.List;

import br.com.fatec.projeto.model.User;

public interface UserDAO {

	/**
	 * Listar todos os usu�rios
	 * 
	 * @return lista de usu�rios
	 */
	public List<User> findAll();

	/**
	 * Retorna o usu�rio pelo id
	 * 
	 * @param id
	 * @return usu�rio
	 */
	public User findById(int id);

	/**
	 * 
	 * @param user
	 */
	public void saveOrUpdate(User user);

	public void remove(int id);
	
	//public User findByEmail(S id);
}
