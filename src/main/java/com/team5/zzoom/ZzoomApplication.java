package com.team5.zzoom;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication //(scanBasePackages = {"com.team5.zzoom.dao.MemberDAO"})
public class ZzoomApplication {

	public static void main(String[] args) {
		SpringApplication.run(ZzoomApplication.class, args);
	}

}
