package com.cs.exlibros.entitades;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

@Transactional
public interface GeneroRepository extends CrudRepository<Genero, Long> {

    @Procedure("insertar_genero")
    void insertar_genero(
            @Param("IN_nombre") String nombre
    );

    @Procedure("listar_generos")
    List<Genero> listar_generos();


/*
    @Procedure("get_usuario_por_email")
    Usuario get_usuario_por_email(
            @Param("IN_email") String email
    );*/
}
