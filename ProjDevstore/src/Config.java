import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;


@Configuration
@ComponentScan("br.com.devstore.controller")
@EnableWebMvc 
public class Config implements WebMvcConfigurer {       
	@Bean
	public UrlBasedViewResolver setupViewResolver() {  
		UrlBasedViewResolver resolver= new UrlBasedViewResolver();  
		resolver.setPrefix("/WEB-INF/jsp/");  
		resolver.setSuffix(".jsp");  
		resolver.setViewClass(JstlView.class);  
		return resolver;  
	}  
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	    registry.addResourceHandler("/pictures/**")
	            .addResourceLocations("/pictures/");
	}
}
