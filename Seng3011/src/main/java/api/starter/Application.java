package api.starter;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
@EnableCaching
@Configuration
@ComponentScan("apiv1.controller,apiv2.controller,apiv3.controller,api.starter,api.cache")
@SpringBootApplication
public class Application extends SpringBootServletInitializer   {
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(Application.class);
	}
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}