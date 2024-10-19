package com.example.booktrade_ko

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import android.widget.Toast

class Libros : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_libros)


    }

    fun agregarLibro(titulo: String, autor: String, descripcion: String) {
        // Lógica para agregar un libro a la lista o base de datos
        Toast.makeText(this, "Libro agregado: $titulo", Toast.LENGTH_SHORT).show()
    }
}
