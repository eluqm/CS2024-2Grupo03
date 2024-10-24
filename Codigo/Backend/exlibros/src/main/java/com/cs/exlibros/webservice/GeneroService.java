package com.cs.exlibros.webservice;

import com.cs.exlibros.entitades.Genero;
import com.cs.exlibros.entitades.GeneroRepository;
import com.cs.exlibros.entitades.Usuario;
import com.cs.exlibros.entitades.UsuarioRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Transactional
@Service
public class GeneroService {
    @Autowired
    private GeneroRepository generoRepository;

    public void insertar_genero(
            String nombre ) {
        generoRepository.insertar_genero(nombre);
    }

    public List<Genero> listar_generos() {
        return generoRepository.listar_generos();
    }

}
