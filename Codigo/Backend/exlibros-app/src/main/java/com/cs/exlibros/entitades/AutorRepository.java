package com.cs.exlibros.entitades;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

@Transactional
public interface AutorRepository extends CrudRepository<Autor, Long> {
    @Procedure("insertar_autor")
    void insertar_autor(
            @Param("IN_nombre") String nombre,
            @Param("IN_apellidos") String apellidos
    );

    @Procedure("buscar_autor_por_nombre")
    List<Autor> buscar_autor_por_nombre(
            @Param("IN_nombre") String nombre
    );

    @Procedure("buscar_autor_por_apellido")
    List<Autor> buscar_autor_por_apellido(
            @Param("IN_apellido") String apellido
    );
}
