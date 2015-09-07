package br.com.fatec.projeto.dao;

import java.util.List;

import br.com.fatec.projeto.model.User;

public interface UserDAO {

	/**
	 * Listar todos os usuários
	 * 
	 * @return lista de usuários
	 */
	public List<User> findAll();

	/**
	 * Retorna o usuário pelo id
	 * 
	 * @param id
	 * @return usuário
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
