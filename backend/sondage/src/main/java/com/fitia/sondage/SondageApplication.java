package com.fitia.sondage;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "com.fitia.sondage.repositories")
public class SondageApplication {

    public static void main(String[] args) {
        SpringApplication.run(SondageApplication.class, args);
    }

}
