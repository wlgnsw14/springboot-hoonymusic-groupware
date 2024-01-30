package kr.co.gudi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class HoonyMusicApplication {

	public static void main(String[] args) {
		SpringApplication.run(HoonyMusicApplication.class, args);
	}

}
