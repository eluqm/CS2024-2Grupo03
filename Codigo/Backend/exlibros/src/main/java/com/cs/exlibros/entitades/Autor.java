package com.cs.exlibros.entitades;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class Autor {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column
    private Long id_autor;

    private String nombre;
    private String apellidos;

    public Autor() {
    }

    public Autor(Long id_autor, String nombre, String apellidos) {
        this.id_autor = id_autor;
        this.nombre = nombre;
        this.apellidos = apellidos;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Long getId_autor() {
        return id_autor;
    }

    public void setId_autor(Long id_autor) {
        this.id_autor = id_autor;
    }
}
