/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.hobsoft.docker.mavenchrome;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.test.web.server.LocalServerPort;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Tests that Selenium can run on Chrome.
 */
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
public class BrowserTest
{
	// ----------------------------------------------------------------------------------------------------------------
	// fields
	// ----------------------------------------------------------------------------------------------------------------
	
	private WebDriver driver;
	
	@LocalServerPort
	private int port;
	
	// ----------------------------------------------------------------------------------------------------------------
	// JUnit methods
	// ----------------------------------------------------------------------------------------------------------------
	
	@BeforeEach
	public void setUp()
	{
		ChromeOptions options = new ChromeOptions()
			.addArguments("--headless=new");
		
		driver = new ChromeDriver(options);
	}
	
	@AfterEach
	public void tearDown()
	{
		driver.close();
	}
	
	// ----------------------------------------------------------------------------------------------------------------
	// tests
	// ----------------------------------------------------------------------------------------------------------------
	
	@Test
	public void canGreet()
	{
		driver.get(String.format("http://localhost:%d", port));
		driver.findElement(By.name("name")).sendKeys("world");
		driver.findElement(By.tagName("button")).click();
		
		assertEquals(driver.findElement(By.tagName("h1")).getText(), "Hello world");
	}
}
