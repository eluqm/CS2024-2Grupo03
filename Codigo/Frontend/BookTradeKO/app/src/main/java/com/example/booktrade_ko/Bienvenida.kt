package com.example.booktrade_ko

import android.os.Bundle
import android.os.CountDownTimer
import androidx.activity.enableEdgeToEdge
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import kotlin.system.measureTimeMillis
import com.google.android.material.bottomnavigation.BottomNavigationView

class Bienvenida : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_bienvenida)
        VerBienvenida()
    }
    fun VerBienvenida(){
        object : CountDownTimer (2000, 1000) {
            override fun onTick(p0: Long){

            }
            override fun onFinish(){
                //dirigirno a main activity
                val intent = Intent(this@Bienvenida, MainActivity::class.java)
                startActivity(intent)
                finishAffinity()
            }
        }.start()
    }
}

