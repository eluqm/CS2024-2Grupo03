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
public class AutorController {
    @Autowired
    private AutorService autorService;

    @GetMapping("/insertarAutor/{nombre}/{apellidos}")
    public void insertarAutor(
            @PathVariable String nombre,
            @PathVariable String apellidos
    ){
        autorService.insertarAutor(nombre, apellidos);
    }

    @GetMapping("/buscarAutorPorNombre/{nombre}")
    public List<Autor> buscarAutorPorNombre(
            @PathVariable String nombre
    ) {
        return autorService.buscarAutorPorNombre(nombre);
    }

    @GetMapping("/buscarAutorPorApellido/{apellido}")
    public List<Autor> buscarAutorPorApellido(
            @PathVariable String apellido
    ) {
        return autorService.buscarAutorPorApellido(apellido);
    }
}
