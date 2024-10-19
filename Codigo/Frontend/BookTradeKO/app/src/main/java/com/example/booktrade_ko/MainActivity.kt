package com.example.booktrade_ko

import android.content.Intent
import android.os.Bundle
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import com.google.android.material.bottomnavigation.BottomNavigationView
import com.example.booktrade_ko.databinding.ActivityMainBinding
import com.example.booktrade_ko.Fragmentos_Admin.Fragment_admin_dashboard
import com.example.booktrade_ko.Fragmentos_Admin.Fragment_admin_cuenta
import com.example.booktrade_ko.Fragmentos_Admin.Fragment_admin_megusta
import com.example.booktrade_ko.Fragmentos_Admin.Fragment_admin_buscador



class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding =ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        VerFragmentoDashboard()

        binding.BottomNvAdmin.setOnItemSelectedListener { item ->
            when (item.itemId){
                R.id.Menu_panel->{
                    VerFragmentoDashboard()
                    true
                }
                R.id.Menu_cuenta->{
                    VerFragmentoCuenta()
                    true
                }
                R.id.Menu_buscador->{
                    VerFragmentoBuscador()
                    true
                }
                R.id.Menu_me_gusta->{
                    VerFragmentoMegusta()
                    true
                }
                else-> false
            }

        }
    }


    private fun VerFragmentoDashboard(){
        binding.TituloRLAdmin.text = "Dashboard"
        val fragment = Fragment_admin_dashboard()
        supportFragmentManager.beginTransaction()
            .replace(binding.FragmentsAdmin.id, fragment, "Fragment dashboard")
            .commit()
    }
    private fun VerFragmentoCuenta(){
        binding.TituloRLAdmin.text = "Mi Cuenta"
        val fragment = Fragment_admin_cuenta()
        supportFragmentManager.beginTransaction()
            .replace(binding.FragmentsAdmin.id, fragment, "Fragment mi cuenta")
            .commit()

    }
    private fun VerFragmentoMegusta(){
        binding.TituloRLAdmin.text = "Me gusta"
        val fragment = Fragment_admin_megusta()
        supportFragmentManager.beginTransaction()
            .replace(binding.FragmentsAdmin.id, fragment, "Fragment me gusta")
            .commit()

    }
    private fun VerFragmentoBuscador(){

        binding.TituloRLAdmin.text = "Buscador"
        val fragment = Fragment_admin_buscador()
        supportFragmentManager.beginTransaction()
            .replace(binding.FragmentsAdmin.id, fragment, "Fragment buscador")
            .commit()

    }
}
