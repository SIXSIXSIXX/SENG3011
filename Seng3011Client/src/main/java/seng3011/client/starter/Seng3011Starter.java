package seng3011.client.starter;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;


@SpringBootApplication(scanBasePackages={"seng3011.client.controller"})// same as @Configuration @EnableAutoConfiguration @ComponentScan combined
public class Seng3011Starter extends SpringBootServletInitializer{
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(Seng3011Starter.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(Seng3011Starter.class, args);
	}
}
