package org.hobsoft.docker.mavenchrome;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@SpringBootApplication
@Controller
public class Application
{
	@GetMapping
	@ResponseBody
	public String index()
	{
		return "<form method='post'>"
			+ "<input name='name' type='text'/>"
			+ "<button type='submit'>Submit</button>"
			+ "</form>";
	}
	
	@PostMapping
	@ResponseBody
	public String submit(String name)
	{
		return String.format("<h1>Hello %s</h1>", name);
	}
	
	public static void main(String[] args)
	{
		SpringApplication.run(Application.class, args);
	}
}
