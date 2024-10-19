package com.cs.exlibros;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.CommandLineRunner;
import com.cs.exlibros.entitades.*;

@SpringBootApplication
public class ExlibrosApplication implements CommandLineRunner {

	private static final Logger logger = LoggerFactory.getLogger(
			ExlibrosApplication.class
	);

	private final UsuarioRepository repository;

	public ExlibrosApplication(UsuarioRepository repository) {
		this.repository = repository;
	}

	public static void main(String[] args) {
		SpringApplication.run(ExlibrosApplication.class, args);
		logger.info("Aplicación iniciada");
	}

	@Override
	public void run(String... args) throws Exception {

	}
}
