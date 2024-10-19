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
public class EditorialControler {
    @Autowired
    private EditorialService editorialService;

    @GetMapping("/insertarEditorial/{nombre}")
    public void insertarEditorial(
            @PathVariable String nombre
    ) {
        editorialService.insertarEditorial(nombre);
    }

    @GetMapping("/listarEditoriales")
    public List<Editorial> listarEditoriales() {
        return editorialService.listarEditoriales();
    }
}
