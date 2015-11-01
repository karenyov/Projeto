package br.com.fatec.projeto.model;

import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

/**
 * @author Karen
 *
 *         10 de out de 2015
 */

@Entity
@Table(name = "PROJETO_EVENT")
public class Event {

	private int id;

	@Column(name = "TITLE")
	private String title;

	@Column(name = "DESCRIPTION")
	private String description;

	@Column(name = "OPTION")
	private String option;

	@Column(name = "CATEGORY")
	private String category;

	@DateTimeFormat(iso = ISO.DATE)
	@Column(name = "DATA_INICIO")
	private Calendar data_inicio;

	@DateTimeFormat(iso = ISO.DATE)
	@Column(name = "DATA_TERMINO")
	private Calendar data_termino;

	@Column(name = "USER_ID")
	private int user_id;

	@Column(name = "LATITUDE")
	private Double latitude;

	@Column(name = "LONGITUDE")
	private Double longitude;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Calendar getData_inicio() {
		return data_inicio;
	}

	public void setData_inicio(Calendar data_inicio) {
		this.data_inicio = data_inicio;
	}

	public Calendar getData_termino() {
		return data_termino;
	}

	public void setData_termino(Calendar data_termino) {
		this.data_termino = data_termino;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

}
