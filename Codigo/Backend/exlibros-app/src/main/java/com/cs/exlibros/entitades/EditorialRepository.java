package com.cs.exlibros.entitades;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

import java.util.List;

@Transactional
public interface EditorialRepository extends JpaRepository<Editorial, Long> {

    @Procedure("insertar_editorial")
    void insertar_editorial(
            @Param("IN_nombre") String nombre
    );

    @Procedure("listar_editoriales")
    List<Editorial> listar_editoriales();

}
