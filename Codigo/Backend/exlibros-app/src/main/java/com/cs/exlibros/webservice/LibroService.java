package com.cs.exlibros.webservice;

import com.cs.exlibros.entitades.LibroRepository;
import com.cs.exlibros.entitades.Libro;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Transactional
@Service
public class LibroService {
    @Autowired
    private LibroRepository libroRepository;

    public void insertarLibro(
            String titulo,
            String detalle,
            String url_imagen,
            Long id_editorial
    ) {
        libroRepository.insertar_libro(
                titulo,
                detalle,
                url_imagen,
                id_editorial
        );
    }

    public List<Libro> listarLibros() {
        return libroRepository.listar_libros();
    }
}
