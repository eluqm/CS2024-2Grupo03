package com.cs.exlibros.entitades;

import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Data
@Entity
public class Editorial {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column
    private Long id_editorial;
    private String nombre;

    public Editorial() { }

    public Editorial(Long id_editorial, String nombre) {
        this.id_editorial = id_editorial;
        this.nombre = nombre;
    }

    public Long getId_editorial() {
        return id_editorial;
    }

    public void setId_editorial(Long id_editorial) {
        this.id_editorial = id_editorial;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
