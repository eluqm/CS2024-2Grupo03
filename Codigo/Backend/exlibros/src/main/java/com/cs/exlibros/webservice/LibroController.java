package com.cs.exlibros.webservice;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.cs.exlibros.entitades.*;

import java.util.List;

@RestController
@RequestMapping("/api")
@Transactional
public class LibroController {

    @Autowired
    private LibroService libroService;

    @GetMapping("/insertarLibro/{titulo}/{detalle}/{url_imagen}/{id_editorial}")
    public void insertarLibro(
            @PathVariable String titulo,
            @PathVariable String detalle,
            @PathVariable String url_imagen,
            @PathVariable Long id_editorial
    ) {
        libroService.insertarLibro(
                titulo,
                detalle,
                url_imagen,
                id_editorial
        );
    }

    @GetMapping("/listarLibros")
    public List<Libro> listarLibros() {
        return libroService.listarLibros();
    }
}
