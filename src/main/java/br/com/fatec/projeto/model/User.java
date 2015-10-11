package br.com.fatec.projeto.model;

import java.util.Calendar;

/**
 * @author Karen
 *
 * 26 de jul de 2015
 */

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Entity
@Table(name = "PROJETO_USER")
public class User {

	private int id;

	@Column(name = "NAME")
	private String name;

	@Size(min = 6, max = 15, message = "A senha deve ter entre 6 e 15 dígitos!")
	@Column(name = "PASSWORD")
	private String password;

	@Pattern(regexp = "^[\\w\\-]+(\\.[\\w\\-]+)*@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$", message = "E-mail com formato incorreto!")
	@Column(name = "EMAIL")
	private String email;

	@Column(name = "CPF")
	private String cpf;

	@DateTimeFormat(iso = ISO.DATE)
	@Column(name = "DATA_NASCIMENTO")
	private Calendar data_nascimento;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public Calendar getData_nascimento() {
		return data_nascimento;
	}

	public void setData_nascimento(Calendar data_nascimento) {
		this.data_nascimento = data_nascimento;
	}

	

}
