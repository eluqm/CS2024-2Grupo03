package com.cs.exlibros.entitades;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class Genero {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column
    private Long id_genero;
    private String nombre;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Long getId_genero() {
        return id_genero;
    }

    public void setId_genero(Long id_genero) {
        this.id_genero = id_genero;
    }
}


