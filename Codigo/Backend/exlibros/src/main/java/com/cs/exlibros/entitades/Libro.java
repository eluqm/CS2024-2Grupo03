package com.cs.exlibros.entitades;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class Libro {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column
    private Long id_libro;
    private String titulo;
    private String detalle;
    private String url_imagen;
    private Long id_editorial;

    public Libro() {
    }

    public Libro(Long id_libro, String titulo, String detalle, String url_imagen, Long id_editorial) {
        this.id_libro = id_libro;
        this.titulo = titulo;
        this.detalle = detalle;
        this.url_imagen = url_imagen;
        this.id_editorial = id_editorial;
    }

    public Long getId_libro() {
        return id_libro;
    }

    public void setId_libro(Long id_libro) {
        this.id_libro = id_libro;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public String getUrl_imagen() {
        return url_imagen;
    }

    public void setUrl_imagen(String url_imagen) {
        this.url_imagen = url_imagen;
    }

    public Long getId_editorial() {
        return id_editorial;
    }

    public void setId_editorial(Long id_editorial) {
        this.id_editorial = id_editorial;
    }
}
