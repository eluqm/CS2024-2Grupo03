package com.cs.exlibros.webservice;

import com.cs.exlibros.entitades.Autor;
import com.cs.exlibros.entitades.AutorRepository;
import com.cs.exlibros.entitades.Usuario;
import com.cs.exlibros.entitades.UsuarioRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Transactional
@Service
public class AutorService {
    @Autowired
    private AutorRepository autorRepository;

    public void insertarAutor(
            String nombre,
            String apellidos
    ) {
        autorRepository.insertar_autor(
                nombre,
                apellidos
        );
    }

    public List<Autor> buscarAutorPorNombre(
            String nombre
    ) {
        return autorRepository.buscar_autor_por_nombre(
                nombre
        );
    }

    public List<Autor> buscarAutorPorApellido(
            String apellido
    ) {
        return autorRepository.buscar_autor_por_apellido(
                apellido
        );
    }
}
