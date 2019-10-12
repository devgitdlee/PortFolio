package com.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

@Configuration
public class TilesConfig {
	
	@Bean
	public TilesConfigurer tilesconfigurer() {
		final TilesConfigurer configurer = new TilesConfigurer();
		configurer.setDefinitions(new String[] {"/WEB-INF/tiles/tiles.xml"});
		configurer.setCheckRefresh(true);
		return configurer;
		
	}
	
	public void configureViewResolvers(ViewResolverRegistry registry) {
		TilesViewResolver resolver = new TilesViewResolver();
		registry.viewResolver(resolver);
		resolver.setOrder(1);
	}

}
