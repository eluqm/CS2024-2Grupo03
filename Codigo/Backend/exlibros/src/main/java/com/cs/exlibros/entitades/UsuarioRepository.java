package com.cs.exlibros.entitades;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

@Transactional
public interface UsuarioRepository extends CrudRepository <Usuario, Long> {
    @Procedure("todos_usuarios")
    List<Usuario> getAllUsuarios();

    @Procedure("get_usuario_por_email")
    Usuario get_usuario_por_email(
            @Param("IN_email") String email
    );

    @Procedure("existe_email_usuario")
    Boolean existe_email_usuario(
            @Param("IN_email") String email
    );

    @Procedure("insertar_usuario")
    void insertar_usuario(
            @Param("IN_nombres") String nombres,
            @Param("IN_apellidos") String apellidos,
            @Param("IN_email") String email,
            @Param("IN_password") String password
    );
}
