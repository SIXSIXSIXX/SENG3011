package api.starter;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class StaticResourceConfiguration extends WebMvcConfigurerAdapter {
	private static final String[] CLASSPATH_RESOURCE_LOCATIONS = {
	        "classpath:/static/", };
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.setOrder(Ordered.HIGHEST_PRECEDENCE);
        
	       registry.addResourceHandler("/resources/**").addResourceLocations(CLASSPATH_RESOURCE_LOCATIONS);
      
    }
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**");
    }
}