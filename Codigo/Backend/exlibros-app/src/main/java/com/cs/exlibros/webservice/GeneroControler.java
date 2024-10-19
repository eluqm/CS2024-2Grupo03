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
public class GeneroControler {

    @Autowired
    private GeneroRepository generoRepository;

    @GetMapping("/insertarGenero/{nombre}")
    public void insertarGenero(
            @PathVariable String nombre
    ) {
        generoRepository.insertar_genero(nombre);
    }

    @GetMapping("/listarGeneros")
    public List<Genero> listarGeneros() {
        return generoRepository.listar_generos();
    }
}
