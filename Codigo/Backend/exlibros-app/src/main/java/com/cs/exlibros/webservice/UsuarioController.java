package com.cs.exlibros.webservice;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.cs.exlibros.entitades.*;

import java.util.List;

@RestController
@RequestMapping("/api")
@Transactional
public class UsuarioController {

    @Autowired
    private UsuarioRepository usuarioRepository;

	@GetMapping("/allUsuarios")
	public List<Usuario> getAllUsuarios() {
		return usuarioRepository.getAllUsuarios();
	}

	@GetMapping("/getUsuarioPorEmail/{email}")
	public Usuario getUsuarioPorEmail(
			@PathVariable String email
	) {
		return usuarioRepository.get_usuario_por_email(email);
	}

	@GetMapping("/existeEmailUsuario/{email}")
	public boolean existeEmailUsuario(
			@PathVariable String email
	) {
		return usuarioRepository.existe_email_usuario(email);
	}

	@GetMapping("/insertarUsuario/{nombres}/{apellidos}/{email}/{password}")
	public void insertarUsuario(
			@PathVariable String nombres,
			@PathVariable String apellidos,
			@PathVariable String email,
			@PathVariable String password
	) {
		usuarioRepository.insertar_usuario(nombres, apellidos, email, password);
	}

}
