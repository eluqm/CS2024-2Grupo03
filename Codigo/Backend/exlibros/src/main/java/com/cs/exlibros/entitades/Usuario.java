package com.cs.exlibros.entitades;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class Usuario {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column
	private Long id_usuario;
	private String nombre;
	private String apellidos;
	private String email;
	private String password;
	
	public Usuario() {
		
	}
	
	public Usuario(String nombres, String apellidos, String email, String password) {
		super();
		this.nombre = nombres;
		this.apellidos = apellidos;
		this.email = email;
		this.password = password;
	}
	
	public String getNombres() {
		return nombre;
	}
	public void setNombres(String nombres) {
		this.nombre = nombres;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
