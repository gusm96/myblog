package com.moyada.myblog.configuration;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

public class WebMvcConfig implements WebMvcConfigurer {
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/myblog/summernoteImage/**").addResourceLocations(
				"file:///C:\\Users\\gusm9\\git\\myblog\\myBlog\\src\\main\\webapp\\resources\\images\\");
		System.out.println(registry);
	}
}
