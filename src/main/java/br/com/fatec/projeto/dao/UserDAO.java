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
	 * retorna um usu�rio procurado pelo id
	 * @param user
	 */
	public void saveOrUpdate(User user);

	/**
	 * remove usu�rio
	 * @param id
	 */
	public void remove(int id);

	/**
	 * retorna um usu�rio procurado pelo email
	 * @param email
	 * @return
	 */
	public User findByEmail(String email);
	
	/**
	 * verifica se o usu�rio est� cadastrado no banco
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
