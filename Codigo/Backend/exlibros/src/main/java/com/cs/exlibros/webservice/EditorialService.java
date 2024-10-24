package com.cs.exlibros.webservice;

import com.cs.exlibros.entitades.Editorial;
import com.cs.exlibros.entitades.EditorialRepository;
import com.cs.exlibros.entitades.Usuario;
import com.cs.exlibros.entitades.UsuarioRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Transactional
@Service
public class EditorialService {
    @Autowired
    private EditorialRepository editorialRepository;

    public void insertarEditorial(String nombre) {
        editorialRepository.insertar_editorial(
                nombre
        );
    }

    public List<Editorial> listarEditoriales() {
        return editorialRepository.listar_editoriales();
    }
}
