package com.cs.exlibros.entitades;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

import java.util.List;

@Transactional
public interface LibroRepository extends JpaRepository<Libro, Long> {

    @Procedure("insertar_libro")
    void insertar_libro (
            @Param("IN_titulo") String titulo,
            @Param("IN_detalle") String detalle,
            @Param("IN_url_imagen") String url_imagen,
            @Param("IN_id_editorial") Long id_editorial
    );

    @Procedure("listar_libros")
    List<Libro> listar_libros();
}
