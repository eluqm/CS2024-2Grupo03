package com.cs.exlibros.webservice;

import com.cs.exlibros.entitades.Usuario;
import com.cs.exlibros.entitades.UsuarioRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Transactional
@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    public List<Usuario> getAllUsuarios() {
        return usuarioRepository.getAllUsuarios();
    }

    public Usuario getUsuarioPorEmail(String email) {
        return usuarioRepository.get_usuario_por_email(email);
    }

    public Boolean existeEmailUsuario(String email) {
        return usuarioRepository.existe_email_usuario(email);
    }

    public void inserar_usuario(
            String nombres,
            String apellidos,
            String email,
            String password
    ) {
        usuarioRepository.insertar_usuario(
                nombres,
                apellidos,
                email,
                password
        );
    }
}
