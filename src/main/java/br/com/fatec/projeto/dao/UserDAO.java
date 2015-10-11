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
	 * retorna um usuário procurado pelo id
	 * @param user
	 */
	public void saveOrUpdate(User user);

	/**
	 * remove usuário
	 * @param id
	 */
	public void remove(int id);

	/**
	 * retorna um usuário procurado pelo email
	 * @param email
	 * @return
	 */
	public User findByEmail(String email);
	
	/**
	 * verifica se o usuário está cadastrado no banco
	 * @param email
	 * @param password
	 * @return true/false
	 */
	public boolean checkLogin(String email, String password);
	
	/**
	 * 
	 * @param email
	 * @return true/false
	 */
	public boolean findEmail(String email);
	
}
